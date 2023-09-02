# Maintainer: Ilnu1123

pkgname=gl3w
pkgver=20220324
pkgrel=10
license=('Unlicense')
pkgdesc='Simple OpenGL core profile loader'
url='https://github.com/skaslev/gl3w'
arch=('any')
depends=('libglvnd' 'glu' 'python' 'python-urllib3')
source=(
    "gl3w_gen.py"
    "gl3w-update"
    "gl3w-update-pacman.hook"
)
sha256sums=(
    '7dfe9a92b52fe151f22361c088d6dd5ddd05549ad69dee8b0986db781ac223b1'
    '00f7b9e02bf49ed851a27ed2d36bef19ba1bcfdd18da64eb83c7bccceda065aa'
    '505534f81fa72a7bdcaf142675bc6cbae414dd608d2b10dee16bbe145e6af6a2'

)
install='post.install'
package(){
    install -Dm755 ./gl3w_gen.py $pkgdir/usr/share/gl3w/gl3w_gen.py
    install -Dm755 ./gl3w-update $pkgdir/usr/share/gl3w/gl3w-update
    install -Dm644 ./gl3w-update-pacman.hook $pkgdir/usr/share/libalpm/hooks/gl3w-update-pacman.hook
}
