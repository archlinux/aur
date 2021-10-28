# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=gliderlabs-sigil
pkgver=0.7.1
pkgrel=1
pkgdesc='Standalone string interpolator and template processor'
arch=('x86_64')
url='https://github.com/gliderlabs/sigil'
license=('BSD')
# a package with the same name exists and provides a binary with the same name
conflicts=('sigil')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        "https://raw.githubusercontent.com/gliderlabs/sigil/master/LICENSE")
sha256sums=('525d7cf80df29a9bbbaa7266ac41efd87d6713f6d64031aa9b19963333e0560b'
            '90b8e840cef9b3c39c1419cf394efe2480544056f55d7d709f3c1b4f47fe9321')

package() {
  cd "${srcdir}"

  install -Dm755 "${pkgname}-amd64" "${pkgdir}/usr/bin/sigil"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
