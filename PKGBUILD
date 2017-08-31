# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=vega10-firmware
pkgver="1.0.20170823"
pkgrel=1
options=(!strip)
pkgdesc="Firmware blobs for AMD Vega10 GPUs"
arch=(any)
url="https://people.freedesktop.org/~agd5f/radeon_ucode/vega10"
license=('custom')
_base="${url}/vega10"
source=("${_base}_acg_smc.bin"
        "${_base}_asd.bin"
        "${_base}_ce.bin"
        "${_base}_gpu_info.bin"
        "${_base}_me.bin"
        "${_base}_mec.bin"
        "${_base}_mec2.bin"
        "${_base}_pfp.bin"
        "${_base}_rlc.bin"
        "${_base}_sdma.bin"
        "${_base}_sdma1.bin"
        "${_base}_smc.bin"
        "${_base}_sos.bin"
        "${_base}_uvd.bin"
        "${_base}_vce.bin")
sha256sums=('f5beaeb5008feb24178bd09dde4165bd91988f1839528d1c4749acb29990114a'
            'bbb53b79ed6c65868c94365550a6b9486a8b9e8dd685a7a1b7ddf0e98102ee82'
            'a1d3670850c6efc58247ed844d0c6bf3ad0f45234177c838af7f6062e716be52'
            '92c3d1d7422c9771a7ff7fc8457884407a1c455150fd70a37badc6cbf7504c58'
            '80884c5ff453332a5feb36a5e7f88d008474ea8ca5ed8d0a81562c06ae9438fe'
            'e19b6c46d30d3d7b60f1c1fbb9d979a64bceb06684a90107334379c3a1355dfe'
            'e19b6c46d30d3d7b60f1c1fbb9d979a64bceb06684a90107334379c3a1355dfe'
            '211f00d306785f9fcbcfe05c5ce66a4366876a18a41e872b187a4f781f242292'
            '36285187ac3177a411183f60b254cc23f5ea4dbc30787e9fb416fdb41573949a'
            '5e4110395e0070509a1f6c38d9eba012666c31eb80854a6f87b90edb208abb99'
            '5e4110395e0070509a1f6c38d9eba012666c31eb80854a6f87b90edb208abb99'
            '44f79a9b6bf1eeb59321a3db719757f21e18e3ccc45fc758a7319287187d2013'
            'bbe70c98817c9cd622c04917fd8c4bed0d0d56260588e6868d900a9b7ff47696'
            '80b6e0717cf16efa8a8ceb959ff6267e0c15fad0b4cad85cf377ef096d037174'
            '58221e6515a45a82ec6901ded87a334d3311f9625ce4c2f2a79cdb0651e20f2d')

package() {
    target="${pkgdir}/usr/lib/firmware/amdgpu"
    install -dm755 "${target}"
    install -m644 -t "${target}" "${srcdir}/"*.bin
}
