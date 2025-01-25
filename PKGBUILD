# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=ca-certificates-cacert
pkgver=20250125
pkgrel=1
pkgdesc="CAcert.org root certificates"
arch=('any')
url="https://www.cacert.org/index.php?id=3"
license=('custom:RDL')
depends=('ca-certificates-utils')
source=("CAcert.org_root_X0F.crt::http://www.cacert.org/certs/root_X0F.crt"
        "CAcert_Class3Root_x14E228.crt::http://www.cacert.org/certs/CAcert_Class3Root_x14E228.crt"
        "LICENSE")
sha512sums=('f04eb3ff2a1741970dbc3e66e5fcd8f22dd7a66384d91bd61d82522958599d4bd85476125ef092ece1f9ee7868d87802ed965bbacb59f9cf467fb627013fe9c7'
            'c888b58d8f2ba64cbbc281dddfff8b3fb5e4f6059400ad4680451f1c4705b67fc337df8a488492e8f251128cc70fe988816e1cd02b8b1fc894c0c69d2727dc5e'
            'ad140136e3529f67d0a2e5ac19d9a97ee80c5305aa793d663f68dd7ab4fdaf711490a78b49172f0c1414e2d7ebfe3d683e649bae047980bfacd7d4a2b7f6d172')

package() {
  cd "${srcdir}"

  install -Dm644 -t "${pkgdir}/usr/share/ca-certificates/trust-source/anchors" *.crt
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
