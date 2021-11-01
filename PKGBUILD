# Maintainer: Curve <curve.platin at gmail.com>
pkgname=il2cpp-dumper-bin
_pkgver=6.6.5
pkgrel=1
pkgver=${_pkgver}
pkgdesc='A tool to reverse engineer il2cpp games'
arch=('x86_64')
url='https://github.com/Perfare/Il2CppDumper'
license=('MIT')
depends=('dotnet-host' 'dotnet-runtime')
provides=('il2cpp-dumper')
conflicts=('il2cpp-dumper')
source=('https://github.com/Perfare/Il2CppDumper/releases/download/v${_pkgver}/Il2CppDumper-netcore-v${_pkgver}.zip'
        'il2cpp-dumper'
        'https://raw.githubusercontent.com/Perfare/Il2CppDumper/master/LICENSE')
sha256sums=('f72ee74361788e4c5e0234abd16bcf386b7088d334bbbbce5bd8b094e82df3a9'
            '2bfdb5eefa9dd52318f1ff8ee0e52ddc602022bdcb4411285d11c95587c7a9d2'
            '373bd2ed813eaa8245d1290138985c6fb025d588db254602720697455ae36c6c')

package() {
  # Install startup script
  install -m 755 -D "il2cpp-dumper" "${pkgdir}/usr/bin/il2cpp-dumper"

  # Install il2cpp files
  install -d "${pkgdir}/usr/share/il2cpp-dumper-bin"
  install -m 644 ${srcdir}/{*.json,*.dll} "${pkgdir}/usr/share/il2cpp-dumper-bin/"
  
  # Install license
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}