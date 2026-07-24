# Maintainer: KFERMercer <https://github.com/KFERMercer> 

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=1.5
pkgrel=1
pkgdesc="The Official ComfyUI Launch Process SUCKs🤮, this is better."
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
            '2c83a395708b9977c040365476218eb3fa3aa85a4331497c11ce1d6a5e1f22c0'
            'f9df3e39609e8384afef2674f4ea9aca58373ade185e2c2fd601beb9d2bed295'
            'eb7a8406fbf0467886b21a978714d4d6a0cf28a93b371fb1cfc32cb0f2ace892')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
