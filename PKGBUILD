# Maintainer : prsh11 (prashantbaid80@gmail.com) 
pkgname='manga-cli-git'
_pkgname='manga-cli'
pkgver=r49.7bdab0c
pkgrel=1
pkgdesc="Manga Cli - script to read manga"
arch=('any')
url="https://github.com/prsh11/manga-cli"
license=('MIT')
depends=('curl' 'zathura' 'zathura-cb' 'pup')
optdepends=('zathura-pdf-poppler: view manga file as pdf' 'imagemagick: converting images to pdf') 
makedepends=('git')
provides=('manga-cli')
source=("git+$url")
md5sums=('SKIP')
pkgver()
{
	cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "$srcdir/$_pkgname"                                                                       
	install -Dm755 ./manga-cli "$pkgdir/usr/bin/manga-cli"
}
