# Maintainer: /dev/rs0 <rs0@secretco.de.com>

pkgname=urlcrazy
pkgver=0.5
pkgrel=3
pkgdesc="Generate and test domain typos and variations to detect and perform typo squatting, URL hijacking, phishing, and corporate espionage."

arch=('any')
license=('custom')
url="http://www.morningstarsecurity.com/research/urlcrazy"

depends=('ruby')
source=("http://www.morningstarsecurity.com/downloads/urlcrazy-${pkgver}.tar.gz")
md5sums=('bfe2e0c71cc5160530b773f15d242964')

package() {
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/urlcrazy/urlcrazy" "${pkgdir}/usr/bin/urlcrazy"

    install -d "${pkgdir}/usr/share/urlcrazy"
    cp -a "${srcdir}/urlcrazy-${pkgver}/." "${pkgdir}/usr/share/urlcrazy"

    install -d "${pkgdir}/usr/share/doc/urlcrazy"
    ln -s "/usr/share/urlcrazy/README" "${pkgdir}/usr/share/doc/urlcrazy"
}
