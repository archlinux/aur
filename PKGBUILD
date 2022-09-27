# Maintainer: XDwanj <xdwanj@qq.com>
pkgname=jetbrains-idea-pj
pkgver=2021.1.3
pkgrel=1
pkgdesc="An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity."
_ideaver=2021-1-3
_buildver=211.7628.21
arch=('x86_64')
url="https://www.jetbrains.com/idea/"
license=('custom:commercial')
options=(!strip)

source=('https://download.jetbrains.com/idea/ideaIU-2021.1.3.tar.gz'
        'https://raw.githubusercontent.com/XDwanj/jetbrains-idea-pj/main/jetbrains-idea-pj.desktop')
#source=('ideaIU-2021.1.3.tar.gz'
#        'jetbrains-idea-pj.desktop')
md5sums=('d60b5c18840552ce14499e4afb237a15'
         '394b981c187dcd127912fb33e42e0cc4')


package() {
  backup=("opt/${pkgname}/bin/idea64.vmoptions" 
          "opt/${pkgname}/bin/idea.properties")

  cd "$srcdir"

  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv idea-IU-${_buildver}/* "$pkgdir"/opt/$pkgname

  chmod 755 -R "$pkgdir"/opt/$pkgname

  ln -s /opt/$pkgname/bin/idea.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/jetbrains-idea-pj.desktop "$pkgdir"/usr/share/applications/jetbrains-idea-pj.desktop
  install -D -m644 "$pkgdir"/opt/$pkgname/bin/idea.svg "$pkgdir"/usr/share/pixmaps/"$pkgname".svg
}
