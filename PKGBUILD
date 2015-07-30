# Maintainer: Andriy Yanko <andriy dot yanko at gmail dot com>
pkgname=jakpod
pkgver=2.82
pkgrel=1
pkgdesc='JakPod is based on Java and allows you to copy music and video files to your iPod.'
arch=('any')
url='http://www.jakpod.de'
license=('custom')
depends=('java-runtime')
source=("jakpod-$pkgver.zip::http://www.jakpod.de/en/downloads/func-download/67/chk,1310a35ece04a2d587132f6db794794a/no_html,1/"
        'jakpod.desktop'
        'jakpod.properties'
        'jakpod.sh'
)
md5sums=('3484d15faa6131a564466ce00e776efa'
         '890e4fc3bcc8d24d452772e1aa910223'
         '68d27e3876efaef150d1d1b252c7d4f7'
         '23af517369a793c8e1eafc4e6d1e425d')

package() {
  cd "${srcdir}"

  install -Dm644 "jakpod.ico" "$pkgdir/opt/$pkgname/jakpod.ico"
  install -Dm644 "jakpod.jar" "$pkgdir/opt/$pkgname/jakpod.jar"
  install -Dm644 "jakpod.png" "$pkgdir/opt/$pkgname/jakpod.png"

  install -Dm644 "thirdparty/sqlite/sqlite-jdbc-3.7.2.jar" "$pkgdir/opt/$pkgname/thirdparty/sqlite/sqlite-jdbc-3.7.2.jar"
  install -Dm644 "thirdparty/jtattoo/jtattoo.jar" "$pkgdir/opt/$pkgname/thirdparty/jtattoo/jtattoo.jar"

  install -Dm644 "jakpod.desktop" "$pkgdir/usr/share/applications/jakpod.desktop"
  install -Dm644 "jakpod.properties" "$pkgdir/opt/$pkgname/jakpod.properties"
  install -Dm755 "jakpod.sh" "$pkgdir/usr/bin/jakpod"
}

# vim:set ts=2 sw=2 et:

