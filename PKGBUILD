# Maintainer: KFERMercer <https://github.com/KFERMercer> 

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=v1.2
pkgrel=1
pkgdesc="The official ways to launch ComfyUI SUCK, this is better."
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
            'ce63c75e7a99933af4b20ef393d2293e13cb6bb7815b790f19731dd67ce751c7'
            'f9df3e39609e8384afef2674f4ea9aca58373ade185e2c2fd601beb9d2bed295'
            '98ec10fc96788d5bebdb3afdb8c4c0e77c69bdae5e606009f998857e0ad27849')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
