# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=vega10-firmware
pkgver="1.0.20170816"
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
sha256sums=('13d8d34a1ec4d1d9aedf6a063a248a5722ea49cba82614799ee5951379f05bb7'
            '0c3f28e5e019900af07efd8dd13db885fecb26fd8a18c0a190eca811e32db9df'
            'a1d3670850c6efc58247ed844d0c6bf3ad0f45234177c838af7f6062e716be52'
            '92c3d1d7422c9771a7ff7fc8457884407a1c455150fd70a37badc6cbf7504c58'
            '80884c5ff453332a5feb36a5e7f88d008474ea8ca5ed8d0a81562c06ae9438fe'
            '4e0c3e305e89cdc0f5b93ab51a5885f14e3ee15414536b49dbde6dc9a8b16874'
            '4e0c3e305e89cdc0f5b93ab51a5885f14e3ee15414536b49dbde6dc9a8b16874'
            '211f00d306785f9fcbcfe05c5ce66a4366876a18a41e872b187a4f781f242292'
            '36285187ac3177a411183f60b254cc23f5ea4dbc30787e9fb416fdb41573949a'
            '173a40ba8dc537c4ca4edf898dcfeb1ec241fe14af52723d1a305499dc4dcd73'
            '173a40ba8dc537c4ca4edf898dcfeb1ec241fe14af52723d1a305499dc4dcd73'
            '44f79a9b6bf1eeb59321a3db719757f21e18e3ccc45fc758a7319287187d2013'
            '1beddd1525eaa8f4af922a191ee64122073b172dcecefab0e5cc54f94e347f4b'
            '80b6e0717cf16efa8a8ceb959ff6267e0c15fad0b4cad85cf377ef096d037174'
            '58221e6515a45a82ec6901ded87a334d3311f9625ce4c2f2a79cdb0651e20f2d')

package() {
    target="${pkgdir}/usr/lib/firmware/amdgpu"
    install -dm755 "${target}"
    install -m644 -t "${target}" "${srcdir}/"*.bin
}
