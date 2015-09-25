# Maintainer: jacopo <jacopo[at]autistici[dot]org>
pkgname=backlight-openrc
pkgrel=1
pkgver=0.1
pkgdesc="Restore the screen brightness at system startup."
url="https://git.covolunablu.org/jacopo/backlight-openrc"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('openrc-core')
#source=("git+https://git.covolunablu.org/jacopo/backlight-openrc.git")
source=("git+https://github.com/antipatico/backlight-openrc.git")
install="$pkgname.install"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
#    printf "r%s" "$(date +%Y%m%d)" "$(git log --pretty=format:'%h' -n 1)"
    git tag | tail -n1
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm=755 backlight "$pkgdir/etc/init.d/backlight"
}
