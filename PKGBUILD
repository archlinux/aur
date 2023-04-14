# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Danny Korpan https://www.dannykorpan.de/
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Vladimir Navrat <vn158 at seznam dot cz>

pkgname=winscp
pkgver=5.21.8
pkgrel=1
pkgdesc="Free SFTP, SCP and FTP client for Wine"
arch=('any')
url="https://winscp.net/"
license=('GPL2')
depends=('wine' 'hicolor-icon-theme')
makedepends=(unzip)
source=("http://downloads.sourceforge.net/project/winscp/WinSCP/${pkgver}/WinSCP-${pkgver}-Portable.zip"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-16.png"
        "${pkgname}-24.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}-64.png"
        "${pkgname}-128.png"
        "${pkgname}-256.png"
        "${pkgname}_default_configuration.ini")
sha256sums=('a2fe8fab9ad3c6d640de407234c6949d9c3c39d7b775827abcc91a13b5d02504'
            '322f3f8d4a29a2e5a40c057ffadf6566ff21233b5f8367a749618e5b4d845fc9'
            '67eba469b8f34ccc2342ea54b14601f13a245af5e0d4ea574786efdd33fc285c'
            '0c28369a4b35713ade79a158b4ee0e28576561c7ba0b8766dbbc0f63d0748ea2'
            'f0be502bd349e0444f1aa39c23737fd4b886370c24723e42fca5e9b45a5f513c'
            '893ed717af8ba6610874554bbd9b423daaf747a472be93ed6794486bfbcf9065'
            'fff3a8f3eff1b2eaace0c8c5c02f7be78579325c0c035a6620595bf2dea0162d'
            '8230504efe2ff8af84ddc162e492d388aeace873c12e46ebe84c68aa9221616e'
            '695540754113cbb61ee2ce4dafd0825c3f864092e805bfbb5abc05c09d16f50d'
            'd09939d5a1c964243eae5ec574148f267b5a3032e8571aba9eca3ee8eaca307f'
            'e55a284b81e55c2dfe330fd7e002b3b6f1224253a67cdf1d34dea35a26d6d1e1')

package() {
  # Install binary files
  install -m 644 -D "${srcdir}/WinSCP.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
  # Install default configuration file
  install -m 644 -D "${srcdir}/${pkgname}_default_configuration.ini" "${pkgdir}/usr/share/${pkgname}/${pkgname}_default_configuration.ini"
  # Install startup script
  install -m 755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Install icons
  for _size in 16 24 32 48 64 128 256
  do
    install -m 644 -D ${pkgname}-${_size}.png "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  # Install desktop file
  install -m 644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
