# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker-bin
_pkgname=mtracker
pkgver=0.7.0
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64' 'aarch64' 'armv7h')
depends=(glibc libgcc)
provides=('mtracker')
conflicts=('mtracker')
source=("https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/completions/bash"
        "https://raw.githubusercontent.com/r-unruh/mtracker/refs/tags/v$pkgver/completions/zsh")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/r-unruh/mtracker/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/r-unruh/mtracker/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::https://github.com/r-unruh/mtracker/releases/download/v$pkgver/$_pkgname-armv7-unknown-linux-gnueabi.tar.gz")
b2sums=('adc18026f965ed2dc8a5414d72af7f0e2e37ce4978e42bb9004e65399f6e3b61330f1ae8174d98747ea15f061d97d8c42a68327b9f8957659dd5216881e72ffc'
        '6e2ca19b2eab5d375b194de58b4bc7e6ab7806310165a950f1af0af6f259567ef1465eaade439adf4d0199371cf334e76a341292fae02ee0c4464f1c21878184'
        'ffdc001fedb90be1369ab5448b63156f95f31fb626e34e08e94dbabd03cedf7f6bad54cff7054ee34b369b5e9e48eba779dfa0b6d66b01c70b6e4a5569b9c50c')
b2sums_x86_64=('d67a6b5f2d55ecfa9797554034268df1e6e2aef9be7ce0d85bcebf2c5c682b7386b06748d84e1f20e32d847a2ba947f2b085c301b69ccc165e81ee722cf67b63')
b2sums_aarch64=('827e9aba72e0b1836ad5d19cdb876287ced32dfc681ce08099861d5a199523906ef0f111b21391592347c2199f7214dca649e95450b5a4c37de465129f95d5bc')
b2sums_armv7h=('fd1a99be44604ad1edb17bc3f2c31c98063409d18da22af83a3ec70d591d45e14b2836248eb0fd2c07f50ac655cbbf4c1e831847d6943c422cab324e2c15058c')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell autocompletion scripts
    install -Dm644 bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
