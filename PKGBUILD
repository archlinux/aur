# Maintainer: robertfoster

pkgname=your-freedom-network
_pkgname=${pkgname%-network}
pkgver=20200925
_subver=01
pkgrel=1
pkgdesc="A service to bypass Firewalls, Proxies and content Filters and stay anonymous while surfing, playing and downloading"
arch=('any')
url="https://www.your-freedom.net/"
license=('LGPL2.1' 'custom:ACCEPTABLE USE POLICY')
depends=('java-runtime' 'bash')
optdepends=('openvpn: VPN mode support'
  'dante: socksification support'
  'tsocks: socksification support')
source=("https://www.your-freedom.net/ems-dist/freedom-$pkgver-$_subver.zip"
  "${_pkgname}.png"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
  'ACCEPTABLE_USE_POLICY')

package() {
  cd "$srcdir"
  install -D -m755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
  install -D "${_pkgname}.png" "$pkgdir/usr/share/pixmaps/your-freedom.png"
  install -D "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -D "freedom.jar" "$pkgdir/usr/share/java/${_pkgname}/freedom.jar"
  install -D "ACCEPTABLE_USE_POLICY" "$pkgdir/usr/share/licenses/${_pkgname}/ACCEPTABLE USE POLICY"
}

sha256sums=('acdaad4713d8e78569deddd926012bc96f9557461b8c5c2fb695eb9faec510b8'
            'cd85329a283099c18e38b31a7b0cfc63b87ad872aefdf974f52b3b7bdbfca845'
            '070a8dc5b7f133e8cb68108dec8587afb1b221e6847553730bc117850fe1bab2'
            '47312a186f0d4ec700a83e39e9afcbe5f1139a45f4b81343c34f6f8908c94adf'
            'f226700bfc52046377444f1490a3d7305a7a13416fa30584ef39804a688d6654')
