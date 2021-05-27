# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=ca-certificates-cacert
pkgver=20210511
pkgrel=1
pkgdesc="CAcert.org root certificates"
arch=('any')
url="https://www.cacert.org/index.php?id=3"
license=('custom:RDL')
depends=('ca-certificates-utils')
source=("CAcert.org_root_X0F.crt::http://www.cacert.org/certs/root_X0F.crt"
        "CAcert.org_class3_X0E.crt::http://www.cacert.org/certs/class3_X0E.crt"
        "LICENSE")
sha512sums=('f04eb3ff2a1741970dbc3e66e5fcd8f22dd7a66384d91bd61d82522958599d4bd85476125ef092ece1f9ee7868d87802ed965bbacb59f9cf467fb627013fe9c7'
            '1d370a9f2dc36ef8de59650d8d589fca62ebf3d7cbc9081fc1c5de67a26a2f4e8a6903ccb488d64cb033f7444d1f613d00451f2d0e8a77a429da82d5ddb41cdf'
            'ad140136e3529f67d0a2e5ac19d9a97ee80c5305aa793d663f68dd7ab4fdaf711490a78b49172f0c1414e2d7ebfe3d683e649bae047980bfacd7d4a2b7f6d172')

package() {
  cd "${srcdir}"

  install -Dm644 -t "${pkgdir}/usr/share/ca-certificates/trust-source/anchors" *.crt
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
