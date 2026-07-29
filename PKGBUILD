# Maintainer: KFERMercer <https://github.com/KFERMercer> 

# shellcheck disable=2034,2148,2154

pkgname=comfykick
pkgver=1.6
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
            '53a4bee78b22b7427527d0692ce9ac52b86579a2cb2a49970a053c999c554eed'
            'f9df3e39609e8384afef2674f4ea9aca58373ade185e2c2fd601beb9d2bed295'
            'fc2904b599d2128ba3f93aaae20530fc77ebe05e124827469d8efe007d2c4b34')

package() {
    install -Dm644 comfykick.py "${pkgdir}/usr/share/${pkgname}/comfykick.py"
    install -Dm644 comfykick.toml "${pkgdir}/usr/share/doc/${pkgname}/comfykick.toml"
    install -Dm644 comfykick.service "${pkgdir}/usr/lib/systemd/user/comfykick.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
