# Maintainer: Ben Mezger <me at benmezger dot nl>
_aurname=shell
_upstream_name=notes
_pkgname=$_aurname-$_upstream_name
pkgname=$_pkgname
pkgver=v1.0.1
pkgrel=1
pkgdesc="Simple delightful note taking, with more unix and less lock-in."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/pimterry/notes"
license=('MIT')
source=(
  'https://raw.githubusercontent.com/pimterry/notes/latest-release/notes'
  'https://raw.githubusercontent.com/pimterry/notes/latest-release/notes.bash_completion'
  'https://raw.githubusercontent.com/pimterry/notes/latest-release/_notes'
)
sha256sums=('65321a9cd0b3c27d3ddafa9d623716151043d7e9132456175968b567b4e2b3ea'
            '4a33a0d9e038879186656984e778fbdd8a992f79e212d760c5a79b8ebf3a7ab4'
            '8a4177d52a856dc940832e40702f971e1ae24918999502b81eea1cad79c3274a')


package() {
        chmod +x $srcdir/$_upstream_name

        mkdir -pv $pkgdir/usr/local/bin
        mkdir -pv $pkgdir/usr/share/bash-completion/
        mkdir -pv $pkgdir/usr/share/zsh/site-functions/

        cp -rfv $srcdir/$_upstream_name $pkgdir/usr/local/bin/$_upstream_name
        cp -rfv $srcdir/$_upstream_name.bash_completion $pkgdir/usr/share/bash-completion/$_upstream_name
        cp -rfv $srcdir/$_upstream_name_ $pkgdir/usr/share/zsh/site-functions/_$_upstream_name
}
