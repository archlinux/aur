# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=git-ego-bin
pkgver=0.2.4
pkgrel=2
pkgdesc='Your Git identity manager and automatic profile switcher.'
url='https://github.com/bgreenwell/git-ego'
arch=('x86_64')
license=('MIT')
provides=('git-ego')
conflicts=('git-ego' 'gitego-bin')
# Renamed from gitego-bin after upstream became bgreenwell/git-ego.
replaces=('gitego-bin')

source=("gitego-$pkgver-${arch}.tar.gz::${url}/releases/download/v${pkgver}/git-ego-v${pkgver}-linux-${arch}.tar.gz")
sha256sums=('c4861fffc6944a7974d329adeba96c325fbb1532541a12386e260b906ae3364f')

package() {
    cd "${srcdir}"
    install -Dm755 "git-ego" "${pkgdir}/usr/bin/git-ego"
    # Upstream renamed the binary; keep the old command name working.
    ln -s git-ego "${pkgdir}/usr/bin/gitego"
}
