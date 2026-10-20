# Maintainer: KFERMercer <https://github.com/KFERMercer>

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=1.9.1
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
        comfykick.toml
        override.conf)

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'f1c278e78e6da3ed7b58f88addafea4fce2a338dabcd678ef177fcd8cf1d5092'
            '6ef02ca6240ea2332a62556d21b30b6fbd37c9c10abd423085f3ad4e6e6b2b05'
            '775e4f5601d4af7c07a233ef4b0155ecb2fb3f56d1dbc5c81f3e96f817a2cff4'
            '4c993df4c0fa00334a9817adedcf2f2bcf8e60e071b378895b520cf0322782b2')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 override.conf "${pkgdir}/usr/share/${pkgname}/override.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
