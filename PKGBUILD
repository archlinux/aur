# Maintainer: KFERMercer <https://github.com/KFERMercer> 

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=v1.0
pkgrel=1
pkgdesc="The official way to launch ComfyUI is suck, this is better."
arch=(any)
url="https://github.com/KFERMercer/ComfyKick"
license=(GPL-3.0-only)
install=${pkgname}.install

depends=(python
         python-yaml
         uv)

optdepends=('cuda: CUDA support'
            'rocm-hip-sdk: ROCm support'
            'intel-compute-runtime: Intel XPU support')

source=(LICENSE
        comfykick.py
        comfykick.service
        comfykick.toml)

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'ebdbf62a292a1e8c5d636f9565b9c574f65079dbf4c1fee87cf7743cca31c33e'
            'a5438512c37eee0570c36bfa2fbdcbb3797d7023510925039a63f6cbe76ba36d'
            'adce6073a337a64f4749a74fdb9f75d3061b9eb209c860e007eb38888e3449cb')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
