# Maintainer: Vyacheslav Konovalov <echo dnlhY2hrb25vdmFsb3ZAZ21haWwuY29tCg== | base64 -d>

pkgname=robo3t-bin
_pkgver=1.1.1
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc='Shell-centric MongoDB management tool'
arch=('x86_64')
url='https://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'pcre')
conflicts=('robo3t' 'robomongo' 'robomongo-bin')
_tarfile="robo3t-${_pkgver}-linux-x86_64-c93c6b0"
source=("https://download.robomongo.org/${_pkgver}/linux/${_tarfile}.tar.gz"
        'https://raw.githubusercontent.com/paralect/robomongo/master/src/robomongo/gui/resources/icons/logo.png'
        'robo3t.desktop')
sha256sums=('fa977cb21c9d1c53fe8ca3323a06b044623fc722116b25dbdd889db701b20c90'
            '62afd8e83603f0785b21ec8692f6945438e00faf068e35dd9c00986e46419196'
            'a603cb8b6750c5cf30fe027f24c74f31ce1c0b2a6b40c11728984e770eff0786')

package() {
  install -Dm0755 "$srcdir/${_tarfile}/bin/robo3t" "$pkgdir/usr/bin/robo3t"
  install -Dm0644 "$srcdir/robo3t.desktop" "$pkgdir/usr/share/applications/robo3t.desktop"
  install -Dm0644 "$srcdir/logo.png" "$pkgdir/usr/share/pixmaps/robo3t.png"
  install -Dm0644 "$srcdir/${_tarfile}/LICENSE" "$pkgdir/usr/share/licenses/robo3t/LICENSE"
  install -Dm0644 "$srcdir/${_tarfile}/COPYRIGHT" "$pkgdir/usr/share/doc/robo3t/COPYRIGHT"
}
