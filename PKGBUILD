# Maintainer: Ben Mezger <me at benmezger dot nl>
_aurname=shell
_upstream_name=notes
_pkgname=$_aurname-$_upstream_name
pkgname=$_pkgname
pkgver=v1.0.0
pkgrel=1
pkgdesc="Simple delightful note taking, with more unix and less lock-in."
arch=('any')
url="https://github.com/pimterry/notes"
license=('MIT')
source=(
  'https://raw.githubusercontent.com/pimterry/notes/latest-release/notes'
  'https://raw.githubusercontent.com/pimterry/notes/latest-release/notes.bash_completion'
  'https://raw.githubusercontent.com/pimterry/notes/latest-release/_notes'
)
md5sums=('4a32ed95ee590c2b52b26a488d95db79'
         '6690eec10fe14663b4d79fca39eccdba'
         '93788aeb11186922a6e547ae2c9e0ac1')

package() {
        chmod +x $srcdir/$_upstream_name

        mkdir -pv $pkgdir/usr/local/bin
        mkdir -pv $pkgdir/usr/share/bash-completion/
        mkdir -pv $pkgdir/usr/share/zsh/site-functions/

        cp -rfv $srcdir/$_upstream_name $pkgdir/usr/local/bin/$_upstream_name
        cp -rfv $srcdir/$_upstream_name.bash_completion $pkgdir/usr/share/bash-completion/$_upstream_name
        cp -rfv $srcdir/$_upstream_name_ $pkgdir/usr/share/zsh/site-functions/_$_upstream_name
}
