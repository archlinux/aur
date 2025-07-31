# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: /dev/rs0 <rs0@secretco.de.com>

pkgname=urlcrazy
pkgver=0.8.2
pkgrel=1
pkgdesc="Generate and test domain typos and variations to detect and perform typo squatting, URL hijacking, phishing, and corporate espionage"
arch=('any')
license=('custom')
url="https://github.com/urbanadventurer/urlcrazy"
depends=('ruby-json' 'ruby-colorize' 'ruby-async' 'ruby-async-dns' 'ruby-async-http')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('0e5cf3c396b9c0f413fbf4ec8861dc964a5b4a01182883c0a88b1f0ffe85dec0')


package() {
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/urlcrazy/urlcrazy" "${pkgdir}/usr/bin/urlcrazy"

    install -d "${pkgdir}/usr/share/urlcrazy"
    cp -a "${srcdir}/urlcrazy-${pkgver}/." "${pkgdir}/usr/share/urlcrazy"

    install -d "${pkgdir}/usr/share/doc/urlcrazy"
    ln -s "/usr/share/urlcrazy/README" "${pkgdir}/usr/share/doc/urlcrazy"
}
