# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=whippet
pkgver=2.1.0
pkgrel=1
pkgdesc="A launcher and xdg-open replacement for control freaks. Opens files and URLs with applications associated by name and/or mimetype. Applications and associations may be customized using an SQLite database."
arch=('any')
url="http://mcfadzean.org.uk/appstogo/linux.html#whippet"
license=('custom:MPL2')
depends=('bash' 'dmenu' 'sqlite' 'libnotify' 'file')
optdepends=('perl-file-mimeinfo: to better determine mimetypes' 'sqlitebrowser: to manage database' 'sudo: to run applications as root' 'gxmessage: to view .desktop files')
source=("http://mcfadzean.org.uk/appstogo/dl/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9ca1fdde2ac07396081eab6a8fee8e03')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dm755 ${pkgname}                  "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.png              "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop          "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ${pkgname}.conf             "$pkgdir/usr/share/doc/${pkgname}/${pkgname}.conf"
  install -Dm644 ${pkgname}_example.sqlite   "$pkgdir/usr/share/doc/${pkgname}/${pkgname}_example.sqlite"
  install -Dm755 ${pkgname}_obpipemenu       "$pkgdir/usr/share/doc/${pkgname}/${pkgname}_obpipemenu"
  install -Dm644 ${pkgname}.1.gz             "$pkgdir/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README                      "$pkgdir/usr/share/doc/${pkgname}/README"
  install -Dm644 CHANGELOG                   "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm755 dudo                        "$pkgdir/usr/share/doc/${pkgname}/dudo"
  install -Dm755 xdg-open                    "$pkgdir/usr/share/doc/${pkgname}/xdg-open"
  msg "Copy sample configuration file /usr/share/doc/${pkgname}/${pkgname}.conf and customize per user"
  msg "Also see '${pkgname} -h' and /usr/share/doc/${pkgname}/README for more information"
  msg ">>>> Database format changed in versions >= 2.1.0 - see /usr/share/doc/${pkgname}/CHANGELOG <<<<"
}
