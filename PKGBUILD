# Maintainer: tenshi <pwoertnehsi@gmail.com>
pkgname=droidvalds-git
pkgver=1.0.r3.g4259875
pkgrel=1
url="https://git.patchouliknowledge.com/tenshi/droidvalds"
install=droidvalds.install
pkgdesc="SystemD Linus Droidvalds GCC Virus"
arch=('any')
depends=('mpv' 'xorg-xrandr' 'bash')
optdepends=('jq: required for the script to work in Niri compositor')
makedepends=('git')
license=('GPL-1.0-or-later')
source=("${pkgname}::git+${url}.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

    install -Dm755 "usr/bin/droidvalds" "${pkgdir}/usr/bin/droidvalds"
    
    install -d "${pkgdir}/usr/share/droidvalds"
    cp "usr/share/droidvalds/"*.mp4 "${pkgdir}/usr/share/droidvalds/"

    install -Dm644 "usr/lib/systemd/user/droidvalds.service" \
                   "${pkgdir}/usr/lib/systemd/user/droidvalds.service"
}
