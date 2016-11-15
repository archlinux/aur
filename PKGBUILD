# Maintainer: jacopo <jacopo[at]autistici[dot]org>
pkgname=backlight-openrc
pkgrel=1
pkgver=2
pkgdesc="Restore the screen brightness at system startup."
url="https://git.covolunablu.org/jacopo/backlight-openrc"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('openrc')
#source=("git+https://git.covolunablu.org/jacopo/backlight-openrc.git")
source=("git+https://github.com/antipatico/backlight-openrc.git"
        fix_script.patch)
install="$pkgname.install"

prepare() {
    cd "$srcdir/$pkgname"
        patch -Np1 -i ../fix_script.patch
}

#pkgver() {
#    cd "$srcdir/$pkgname"
#    printf "r%s" "$(date +%Y%m%d)" "$(git log --pretty=format:'%h' -n 1)"
#    git tag | tail -n1
#}

package() {
    cd "$srcdir/$pkgname"
    install -Dm=755 backlight "$pkgdir/etc/init.d/backlight"
}

sha256sums=('SKIP'
            'd80671027a454ed0f7961012c61939f2df5519af0adb8bc453b677b5eed7f57b')
