# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=1.1.77
pkgrel=4
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver")
conflicts=("torrserver-git")
depends=("glibc")
install=torrserver.install

sysemd_source="https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service"

source_x86_64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-amd64" $sysemd_source)
source_i686=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-386" $sysemd_source)
source_arm=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm5" $sysemd_source)
source_armv6h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm6" $sysemd_source)
source_armv7h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7" $sysemd_source)
source_aarch64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64" $sysemd_source)

case "$CARCH" in
  x86_64) _CARCH=amd64 ;;
  i686) _CARCH=386 ;;
  arm) _CARCH=arm5 ;;
  armv6h) _CARCH=arm6 ;;
  armv7h) _CARCH=arm7 ;;
  aarch64) _CARCH=arm64 ;;
  *) return 1 ;;
esac

package() {
  install -Dm644 "$srcdir/torrserver.service" "$pkgdir/usr/lib/systemd/system/torrserver.service"
  install -Dm755 "${srcdir}/TorrServer-linux-${_CARCH}" "$pkgdir/usr/bin/torrserver"
}

b2sums_x86_64=('55a768c9a9adf11e425fa0fda58bb6431fbb70669be6d8dd0f9704b98a6025918e501e6e79d8c41a344390f867f8070919f77ce1384fd0bcd5f4a2075b38a5e0'
               'd70ffaffb396d19fc93f1afd54b856b221b4fe811f04cc839fd3d0e6312771fda8fa8d2baa942ac2ac8cbcfbfca7b90ae87cec0115697d5654e9bca727202387')
b2sums_arm=('ed590ab80a2c8aa37e5bf8cdb3be534ca10c29a430d3516a7f842ac5537d3691faab3703c19e433f2783a63b6b890b0ddb49ae2447d9c118a3e5820f888d772d'
            'd70ffaffb396d19fc93f1afd54b856b221b4fe811f04cc839fd3d0e6312771fda8fa8d2baa942ac2ac8cbcfbfca7b90ae87cec0115697d5654e9bca727202387')
b2sums_armv6h=('2862ec6ee96bfc02269cdd3c407ed8bd7756bcb52e84363385656297d78256d270e530c634ce2b4b819ef8939e2a0e4a06fb32e4d2d185bb373776bb11b40fc8'
               'd70ffaffb396d19fc93f1afd54b856b221b4fe811f04cc839fd3d0e6312771fda8fa8d2baa942ac2ac8cbcfbfca7b90ae87cec0115697d5654e9bca727202387')
b2sums_armv7h=('ad0f2f547b756d917b94e29d7697994c8c1fadfaaecb002a1f56bd43286f4bce5db3955b626a419c0d6c582a1192021866e35a075dc702047b6ae5c6b9888d4a'
               'd70ffaffb396d19fc93f1afd54b856b221b4fe811f04cc839fd3d0e6312771fda8fa8d2baa942ac2ac8cbcfbfca7b90ae87cec0115697d5654e9bca727202387')
b2sums_aarch64=('3a1d9a4d62d65d69974fb3ba4336c870c8084bc9a1a5ec4d783dda4caa0cb418ce4bd349ca0f685540a7d72bce875907a84e26310d211431ea5635891b2711ee'
                'd70ffaffb396d19fc93f1afd54b856b221b4fe811f04cc839fd3d0e6312771fda8fa8d2baa942ac2ac8cbcfbfca7b90ae87cec0115697d5654e9bca727202387')
b2sums_i686=('5f20521acc4e4ec7f0bfb43b6f76cf1d10b5e50561c3c89e029b9103e616aa9a052f3ab37cb01994349540e27f862b9167eec9ff4f593a009387e7b274658903'
             'd70ffaffb396d19fc93f1afd54b856b221b4fe811f04cc839fd3d0e6312771fda8fa8d2baa942ac2ac8cbcfbfca7b90ae87cec0115697d5654e9bca727202387')
