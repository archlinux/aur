pkgname='kanjitomo'
pkgdesc="identify Japanese characters from images or screen"
pkgver=0.9.12
pkgrel=2
arch=('any') 
license=('custom')
url="http://kanjitomo.net"
source=("$pkgname.zip::http://kanjitomo.net/download.php")
md5sums=('01e3a772259ddda4c7fa4d58c6f02a00')
depends=('java-environment')

package () {
  cd "$pkgsrc"
  # install
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r data images lib wallpaper KanjiTomo.jar "$pkgdir/usr/share/$pkgname"
  chmod o+rwx "$pkgdir/usr/share/$pkgname/data/cache" # tell me a better option
  # licenses
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/${pkgname}_license"
  sed -n '/## ACKNOWLEDGEMENTS ##/,$p' README.txt > "$pkgdir/usr/share/licenses/$pkgname/libraries_license_information"
  # starter
  mkdir -p "$pkgdir/usr/bin/"
  echo -e "#!/bin/bash\ncd /usr/share/kanjitomo\nexec java -Xmx1000m -jar KanjiTomo.jar -run" > "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
  # desktopfile
  mkdir -p "$pkgdir/usr/share/applications/"
  echo -e "[Desktop Entry]\nName=$pkgname\nComment=$pkgdesc\nExec=/usr/bin/$pkgname\nTerminal=false\nType=Application\nCategories=Education\nIcon=$pkgname" \
    > "$pkgdir/usr/share/applications/$pkgname.desktop"
  # desktopfile image, feel free to remove
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  echo -n "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
RU5ErkJggg==" | base64 -d > "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
