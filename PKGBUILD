# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Davide Depau <davide@depau.eu>
pkgname=libviperfx
pkgver=r11.6f7d0da
pkgrel=2
pkgdesc="ViPER FX core library"
arch=('x86_64')
url="https://github.com/vipersaudio/viperfx_core_binary"
license=('LicenseRef-custom')
_commit=6f7d0da725affe854f083baf5d90c70e172e4488
source=("git+https://github.com/vipersaudio/viperfx_core_binary.git#commit=${_commit}"
        'LICENSE')
sha256sums=('ee10d1ab1b6c6b08e31c6d287aeaca36072fe9a706b3c864990fbcff92f207c8'
            'dae3ec0afb199748ea89393181a296ae2e5ee41d5c87570d16c8d8e24d891cc7')

pkgver() {
  cd viperfx_core_binary
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd viperfx_core_binary
  install -Dm755 "${pkgname}_x64_linux.so" "$pkgdir/usr/lib/$pkgname.so"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
