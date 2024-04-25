# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=checksec-rs
pkgver=0.0.9
pkgrel=1
pkgdesc="Fast multi-platform (ELF/PE/MachO) binary checksec written in Rust"
arch=('x86_64')
url="https://github.com/etke/checksec.rs"
license=('Apache')
makedepends=('cargo' 'fakeroot' 'binutils')
conflicts=('checksec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2edbb6945f72fe7cca0f33617686a614e941264f234db9c59c59ccf3a3cfe1ad66b0373623bce622dd70834e833acf1f5a3785045c5a15b8e56938693d75e10d')

package() {
    cd "${srcdir}/checksec.rs-${pkgver}"
    cargo install --locked --root "${pkgdir}/usr" --path .
    rm -f "${pkgdir}/.crates.toml" "${pkgdir}/.crates2.json"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
