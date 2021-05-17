# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=soundrts
pkgname=$_pkgname-git
pkgver=1.2.a8.r6.g395d894
pkgrel=1
pkgdesc="A real-time strategy audio game"
arch=('any')
url="https://github.com/chrys87/soundrts"
license=('BSD' 'Unknown')
depends=('python' 'python-pygame' 'simpleorcapluginsystem')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/chrys87/soundrts.git"
        "$_pkgname.desktop"
        "$_pkgname.sh")
sha512sums=('SKIP'
            '2341fa4183feb5f571e10aef8b442e5967612c6c842e2b623099e934316498885afdbd7e9aa84339d98f53648fe173a028e0140d1568c4042bfdcefa84904bed'
            'f4d8bc5df309681f607eb444c097cde74819d8aa2775592acea3a47b876cc3c9c5d0609e43b5bff2f01e5567c1adad2b6e8c9cef1c70efd5f3f7678f7c2990d5')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/opt/soundrts"
  cp -a * "$pkgdir/opt/soundrts" # not very nice, this installs a lot of unnecessary files

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
