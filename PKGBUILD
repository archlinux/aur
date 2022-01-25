# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: /dev/rs0 <rs0@secretco.de.com>

pkgname=urlcrazy
pkgver=0.5
pkgrel=4
pkgdesc="Generate and test domain typos and variations to detect and perform typo squatting, URL hijacking, phishing, and corporate espionage."

arch=('any')
license=('custom')
url="https://www.morningstarsecurity.com/research/urlcrazy"

depends=('ruby')
source=("https://www.morningstarsecurity.com/downloads/urlcrazy-${pkgver}.tar.gz")
sha256sums=('744bfee0933dc8f1f2432528d5f7c5ce770416146ddc67b984b5117426e99dcd')

package() {
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/urlcrazy/urlcrazy" "${pkgdir}/usr/bin/urlcrazy"

    install -d "${pkgdir}/usr/share/urlcrazy"
    cp -a "${srcdir}/urlcrazy-${pkgver}/." "${pkgdir}/usr/share/urlcrazy"

    install -d "${pkgdir}/usr/share/doc/urlcrazy"
    ln -s "/usr/share/urlcrazy/README" "${pkgdir}/usr/share/doc/urlcrazy"
}
