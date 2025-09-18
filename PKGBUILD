# Maintainer: Felix Schindler <aur at felixschindler dor net>
pkgname=zakwl-cryptfile
pkgver=1.1
pkgrel=3
pkgdesc="Encryption and decryption manager for dentists in Westfalen-Lippe (Germany)"
arch=('x86_64')
url="https://www.zahnaerzte-wl.de/pages/zakwl-verschlusselungs-und-entschlusselungs-manager"
license=('unknown') # They say 'Es sind keine Anmeldungen, Lizenzen oder zusätzliche kostenpflichtige Komponenten notwendig.', so roughly no license required.
source=(https://www.zahnaerzte-wl.de/download/ca97af8ce907823ebd71d3a40/INSTALL_CRYPTFILE_LINUX_x86_64.zip
        Cryptfile.ico
        zakwl-cryptfile.desktop)
sha256sums=('421a58dc8388453237388c4ec1def79c761fca3ff0a04e623495cef80c046ba2'
            '9256e503b8d17a9210a8954cf38c842a1e18c04fd7dcc23b54be20e412354da3'
            '655681603679baa94d447bd5f7dc1754a760026255e7d30fdaa56d580c2002ab')

build() {
    echo Nothing to build.
}

package() {
  cd "$srcdir"
  install -d ${pkgdir}/usr/local/share/applications
  install -m 644 zakwl-cryptfile.desktop ${pkgdir}/usr/local/share/applications/zakwl-cryptfile.desktop
  install -d ${pkgdir}/usr/local/bin
  install -m 755 Cryptfile ${pkgdir}/usr/local/bin/Cryptfile
  install -d ${pkgdir}/usr/local/share/icons/${pkgname}
  install -m 644 Cryptfile.ico ${pkgdir}/usr/local/share/icons/${pkgname}/Cryptfile.ico
}
