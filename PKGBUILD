# Maintainer: KFERMercer <https://github.com/KFERMercer>

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=1.7.3
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
            'c50b38de5663fe4cbda5198b85b03f8418ad82c7c2f9ba55832aed2a9bc7a2ea'
            '56eb87aad2f9d8ec1c4fd6ef8eed0267b617aa6025dd53fc90349ba8f29c865d'
            '6b26b19b2480cb1e3660d17b7cf250d064391453b25808d68f969bb69ac44a6f'
            '4c993df4c0fa00334a9817adedcf2f2bcf8e60e071b378895b520cf0322782b2')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 override.conf "${pkgdir}/usr/share/${pkgname}/override.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
