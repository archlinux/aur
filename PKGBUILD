# Maintainer: KFERMercer <https://github.com/KFERMercer>

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=1.7.5
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
            '1edee1463d0ce65145fe4383d28fa805ef3a76c57b6c3f813228e8912cfc4e49'
            '835593856f8033041de9572920fe7a11c04bab5fea1c619a888418bba6bd3a97'
            '6b26b19b2480cb1e3660d17b7cf250d064391453b25808d68f969bb69ac44a6f'
            '4c993df4c0fa00334a9817adedcf2f2bcf8e60e071b378895b520cf0322782b2')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 override.conf "${pkgdir}/usr/share/${pkgname}/override.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
