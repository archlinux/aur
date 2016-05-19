# Contributor: Prurigro
# Maintainer: Prurigro
pkgname=gdatafs
pkgver=1.0.2
pkgrel=2
pkgdesc='FUSE implementation that mounts Picasa, YouTube, and Google Docs on your filesystem'
url='http://gdatafs.sourceforge.net'
license=('GPL')
depends=('fuse' 'java-runtime')
changelog=ChangeLog
source=("https://sourceforge.net/projects/gdatafs/files/gdatafs $pkgver.tar.gz"
        'gdatafs.sh')
md5sums=('77e5207f1b2cfb72307087ebceb7b801'
         '51417a54871ac6e1a3917ba7ada128a4')
arch=('any')

package() {
  cd "$srcdir"/gdatafs
  find . -type f -not \( -path "*/.svn/*" -o -path "*/.project" -o -path "*/.classpath" -o -path "*/src*/*" \) | sed -e 's/\.\///g' | while read file; do
    install -D "$file" "$pkgdir"/opt/gdatafs/"$file"
  done
  install -Dm755 "$srcdir"/gdatafs.sh "$pkgdir"/usr/bin/gdatafs
}
