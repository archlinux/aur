#Maintainer: q9 <qqqqqqqqq9 at gmeyer dot df-kunde dot de>
#Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=bashtrash
pkgver=20101105
pkgrel=1
pkgdesc="Freedesktop-complient trashcan implemented in bash script"
arch=('any')
url="https://github.com/robrwo/bashtrash/blob/master/trash"
license=('GPL')
depends=('bash')
makedepends=('git')
source=(git+https://github.com/robrwo/bashtrash.git link.patch trash)
md5sums=('SKIP'
         'b648a35e9ad747fcb096a084dbe3a786'
         'b812b8a04c31b14383f48fd1bdd1f1d0')
package() {
  # Modified link handling, always use Trash beyond Home-Folder
  # patch -p0 < link.patch                
  # vimdiff trash $srcdir/bashtrash/trash # review if the patch worked as expected
  install -D bashtrash/trash $pkgdir/usr/bin/trash
} 
