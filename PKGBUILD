# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=vega10-firmware
pkgver="1.0.0"
pkgrel=1
options=(!strip)
pkgdesc="Firmware blobs for AMD Vega10 GPUs"
arch=(any)
url="https://people.freedesktop.org/~agd5f/radeon_ucode/vega10/"
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
sha256sums=('f5fd91e6e3e6407108e7d8f925774f1822a7d9d9b98071bccaab45a559a85b1c'
            'aeb484adb365e4b51b7f974da96ea45480e6111fe10be57f28dada67ec56cc41'
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
            'bb5bb35d30565178c3611a6e4a171ba2c5410fbebcdba784378275b527da96b7'
            '78e562e23ef146bdef5dccd272883632cb383cc3c1608cf8f439635da4b55acd'
            '58221e6515a45a82ec6901ded87a334d3311f9625ce4c2f2a79cdb0651e20f2d')

package() {
    target="${pkgdir}/usr/lib/firmware/amdgpu"
    install -dm755 "${target}"
    install -m644 -t "${target}" "${srcdir}/"*.bin
}
