# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >
# Contributor: wilke
# Contributor: envolution

pkgname=harsh-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="CLI habit tracking for geeks"

arch=('x86_64')
license=('MIT')
url="https://github.com/wakatara/harsh"

provides=('harsh')
conflicts=('harsh')

source_x86_64=("${pkgname}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/harsh_Linux_${arch[0]}.tar.gz")
sha256sums_x86_64=('276e2c22f667764341044d810da0db092608fc343ad240ca7a8244d1fd8f0048')

package() {
    install -Dm755 harsh -t "${pkgdir}/usr/bin/"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    ./harsh completion bash > "${pkgdir}/usr/share/bash-completion/completions/harsh"

    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    ./harsh completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/harsh.fish"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    ./harsh completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_harsh"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
