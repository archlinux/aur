# Maintainer: XDwanj <xdwanj@qq.com>
pkgname=jetbrains-clion-pj
pkgver=2021.1.3
pkgrel=1
pkgdesc="A cross-platform IDE for C and C++."
_clionver=2021-1-3
_buildver=211.7628.27
arch=('x86_64')
url="https://www.jetbrains.com/clion/"
license=('custom')
options=(!strip)

source=('https://download.jetbrains.com/cpp/CLion-2021.1.3.tar.gz'
        'https://raw.githubusercontent.com/XDwanj/jetbrains-clion-pj/main/jetbrains-clion-pj.desktop')
#source=('CLion-2021.1.3.tar.gz'
#        'jetbrains-clion-pj.desktop')
md5sums=('24cca82f760a52aaf47a00f86f0ee0df'
         '13a4fe6508442eb9654feecbe34d47e9')


package() {
  backup=("opt/${pkgname}/bin/clion64.vmoptions"
          "opt/${pkgname}/bin/idea.properties")
          
  cd "$srcdir"
    
  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv clion-${pkgver}/* "$pkgdir"/opt/$pkgname
  
  chmod 755 -R "$pkgdir"/opt/$pkgname
  
  ln -s /opt/$pkgname/bin/clion.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -D -m644 "$pkgdir"/opt/$pkgname/bin/clion.svg "$pkgdir"/usr/share/pixmaps/"$pkgname".svg
}
