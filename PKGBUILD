# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=ca-certificates-cacert
pkgver=20140824
pkgrel=5
pkgdesc="CAcert.org root certificates"
arch=('any')
url="https://www.cacert.org/index.php?id=3"
license=('custom:RDL')
depends=('ca-certificates-utils')
source=("CAcert.org_root.crt::http://www.cacert.org/certs/root.crt"
        "CAcert.org_class3.crt::http://www.cacert.org/certs/class3.crt"
        "LICENSE")
sha512sums=('7350f2604e9839f1c2d02926fd4299468ffe2c456ba57a396575cfbb5b2b91fa3cb0e049f6cf3e1406d02014e420e263d6b0c4a59c51d0f03a735bfaa56ec7cc'
            '416ceb36aa399f5116c617d470545a04e56bba2282e18fa7c1cc68271d8ac2e7b5787c7ea0f759794351f6e1ad77c76301664db10587046b2b269b274098845c'
            'ad140136e3529f67d0a2e5ac19d9a97ee80c5305aa793d663f68dd7ab4fdaf711490a78b49172f0c1414e2d7ebfe3d683e649bae047980bfacd7d4a2b7f6d172')

package() {
  cd "${srcdir}"

  install -Dm644 -t "${pkgdir}/usr/share/ca-certificates/trust-source/anchors" *.crt
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
