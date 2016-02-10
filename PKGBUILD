pkgname=sine
pkgver=latest
pkgrel=1
pkgdesc="Brainwave Entrainment Application"
arch=(any)
depends=('java-runtime')
license=('GPL3')
url='http://sine.adolfintel.com'
source=(sine sine-cli sine-editor sine.desktop sine-editor.desktop sine.png editor.png preset.png preset-mime.xml http://downloads.adolfintel.com/geth.php?r=sine-pcbin)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
install=sine.install

package() {
  cd "$srcdir"
  echo "$pkgdir $srcdir"
  
  rm -f "${srcdir}/"geth.*
  rm -f "${srcdir}/"*.txt
  rm -f "${srcdir}/"*.md

  mkdir -p "${pkgdir}/usr/share/sine/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/bin/"
  
  cp -LRf "${srcdir}/"* "${pkgdir}/usr/share/sine/"
  mv "${pkgdir}/usr/share/sine/sine" "${pkgdir}/usr/bin/SINE"
  mv "${pkgdir}/usr/share/sine/sine-cli" "${pkgdir}/usr/bin/SINE-CLI"
  mv "${pkgdir}/usr/share/sine/sine-editor" "${pkgdir}/usr/bin/SINE-Editor"
  chmod 755 "${pkgdir}/usr/bin/SINE"
  chmod 755 "${pkgdir}/usr/bin/SINE-CLI"
  chmod 755 "${pkgdir}/usr/bin/SINE-Editor"
  chmod -R 755 "${pkgdir}/usr/share/sine/lib"*
  chmod 755 "${pkgdir}/usr/share/sine/"*.jar
  chmod -R 644 "${pkgdir}/usr/share/sine/editor_manual/"*
  mv "${pkgdir}/usr/share/sine/"*.desktop "${pkgdir}/usr/share/applications/"
  
  
}

