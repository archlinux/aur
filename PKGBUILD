# Maintainer: 4censord <mail@business-insulting.de>
# Contributer: Martchus <martchus@gmx.net>

pkgname=genesis-starter
pkgver=6.3.1
pkgrel=1
arch=('any')
pkgdesc="Character creation tool for Splittermond"
url="http://blog.rpgframework.de"
license=('unknown')
depends=('java-runtime' 'freetype2' 'libxtst' 'alsa-lib' 'libnet' 'libxrender' 'xdg-utils')
source=("https://www.rpgframework.de/downloads/linux/genesis-6.3.1-1.x86_64.rpm"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('1c6a7dbbdde92546ce825103056b99869ab8a31c43a9a68177e265dc07621235'
            'df047584bc29b584d0b2e311478b98ed216d9a7a63d6ad96d9bd6c3aa2239a0c'
            '38f5092e84411445e085bdd9e2bca579029406379042337fd0a72fccbf4f363d')
package() {
  # stuff
  cp -r "$srcdir"/opt $pkgdir
  cp -r "$srcdir"/usr $pkgdir
  
  # start script
  install -m755 -D "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # menu entry
  install -m644 -D "./${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
