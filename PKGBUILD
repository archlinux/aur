# Maintainer: phantom <info@euniversity.pub>
pkgname=tlauncher-tl
pkgver=999
pkgrel=0
pkgdesc="The best Minecraft launcher"
arch=('x86_64')
url="https://tlauncher.org/"
license=('custom')
depends=('jre-openjdk')
source=(
    'tlauncher.zip::https://tlauncher.org/jar'
    'tlauncher.desktop'
    'tlauncher.svg'
)

build() {
  cd "${srcdir}/"
  rm -f README-*
  mv TLauncher-*.jar tlauncher.jar
}

package () {
    cd "$pkgdir"
    install -Dm644 "$srcdir/tlauncher.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/tlauncher.svg"
    install -Dm644 "$srcdir/tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
    install -Dm777 "$srcdir/tlauncher.jar" "$pkgdir/usr/lib/tlauncher/tlauncher.jar"
    chmod 777 "$pkgdir/usr/lib/tlauncher"
}

md5sums=(SKIP
         '01c121c05252cd5cb5dcf83d5fd7b4e7'
         'de9e7f76196ca1b049725e43b7799bdb'
)
