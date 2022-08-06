# Maintainer: # Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>

pkgname=nvidia-gpu-exporter-bin
_pkgname=nvidia-gpu-exporter
pkgver=1.0.0
pkgrel=2
pkgdesc="Nvidia GPU exporter for prometheus using nvidia-smi binary"
arch=(x86_64)
url="https://github.com/utkuozdemir/nvidia_gpu_exporter"
license=(MIT)
source=(
    "https://github.com/utkuozdemir/nvidia_gpu_exporter/releases/download/v1.0.0/nvidia_gpu_exporter_1.0.0_linux_x86_64.tar.gz"
    "$_pkgname.sysusers"
    "$_pkgname.service"
)
b2sums=(
    "de10069fe962efa7d8c0cc12d56aec001d7e1e87c36991bdcf9c3e8b8571586ae3a0ae547cff169b59de17d07cf45a1275a0719757e5d3db6ea66734d712a7c8"
    "fb56cec66cfcbb783715f29f287034fb7c9d92afacce5944f1a36eda94a803defc725fb865b7a548db26ca049ae2f471e2cebea06a11ff4a95d0d74e3b953c99"
    "5fe6c6f9bbdcb16c6b3495ad900a5387ab311963507a424c3c468d084e37940c4dec8451660caa5c77cf0aec31005b4bc7764d6a42aaccc0ea88edb18dae1ac6"
)


package() {
    # systemd
    install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

    # binary
    install -Dm755 "$srcdir/${_pkgname//-/_}" "$pkgdir/usr/bin/$_pkgname"

    # license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}