# Maintainer: Felix Schindler <aur at felixschindler dor net>
pkgname=zakwl-cryptfile
pkgver=1.1
pkgrel=1
pkgdesc="Encryption and decryption manager for dentists in Westfalen-Lippe (Germany)"
arch=('x86_64')
url="https://www.zahnaerzte-wl.de/pages/zakwl-verschlusselungs-und-entschlusselungs-manager"
license=('unknown') # They say 'Es sind keine Anmeldungen, Lizenzen oder zusätzliche kostenpflichtige Komponenten notwendig.', so roughly no license required.
source=(https://www.zahnaerzte-wl.de/download/538d75015465ee861df9286a8/Install_CryptFile_1_1_LINUX.zip
        zakwl-cryptfile.desktop)
sha256sums=('89d85a4f951a4090c1e246539091f4efcaaada44e888e21428ae0ca90712904b'
            '655681603679baa94d447bd5f7dc1754a760026255e7d30fdaa56d580c2002ab')

build() {
    echo Nothing to build.
}

package() {
  cd "$srcdir"
  install -d ${pkgdir}/usr/local/share/applications
  install -m 644 zakwl-cryptfile.desktop ${pkgdir}/usr/local/share/applications/zakwl-cryptfile.desktop
  cd "$srcdir/LINUX"
  install -d ${pkgdir}/usr/local/bin
  install -m 755 Cryptfile ${pkgdir}/usr/local/bin/Cryptfile
  install -d ${pkgdir}/usr/local/share/icons/{pkgname}
  install -m 644 Cryptfile.ico ${pkgdir}/usr/local/share/icons/{pkgname}/Cryptfile.ico
}
