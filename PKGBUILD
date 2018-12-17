# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=goboy
pkgver=0.4.2
pkgrel=1
pkgdesc="Multi-platform Nintendo Game Boy Color emulator written in go"
arch=("x86_64")
url="https://humpheh.github.io/${pkgname}"
license=("MIT")
depends=("gtk2" "gtk3")
makedepends=("git" "go-pie")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Humpheh/${pkgname}/archive/v${pkgver}.tar.gz"
        "glhf-82a6317ac380cdc61567d729fe48833d75b8108e.tar.gz::https://github.com/faiface/glhf/archive/82a6317ac380cdc61567d729fe48833d75b8108e.tar.gz"
        "mainthread-8b78f0a41ae388189090ac4506612659fa53082b.tar.gz::https://github.com/faiface/mainthread/archive/8b78f0a41ae388189090ac4506612659fa53082b.tar.gz"
        "pixel-7b509e1d7d67aee5f81cb01596299867d905d990.tar.gz::https://github.com/faiface/pixel/archive/7b509e1d7d67aee5f81cb01596299867d905d990.tar.gz"
        "gl-55b76b7df9d25d70b63e31a767f47158292b85d8.tar.gz::https://github.com/go-gl/gl/archive/55b76b7df9d25d70b63e31a767f47158292b85d8.tar.gz"
        "glfw-691ee1b84c51ae625ed1aafebc915d3db3d63d66.tar.gz::https://github.com/go-gl/glfw/archive/691ee1b84c51ae625ed1aafebc915d3db3d63d66.tar.gz"
        "mathgl-cdf14b6b8f8a4a1bfb003dd5119205c5f711d85a.tar.gz::https://github.com/go-gl/mathgl/archive/cdf14b6b8f8a4a1bfb003dd5119205c5f711d85a.tar.gz"
        "oto-3a9bb05c78a0583c0f5a6c041eeb05a6ceec8ef9.tar.gz::https://github.com/hajimehoshi/oto/archive/3a9bb05c78a0583c0f5a6c041eeb05a6ceec8ef9.tar.gz"
        "go-gtk-ab259656e6a458c72e0a54a95b09df331b3bc20b.tar.gz::https://github.com/mattn/go-gtk/archive/ab259656e6a458c72e0a54a95b09df331b3bc20b.tar.gz"
        "go-pointer-49522c3f37914a12a6813caf41f4a9e84d39ca0a.tar.gz::https://github.com/mattn/go-pointer/archive/49522c3f37914a12a6813caf41f4a9e84d39ca0a.tar.gz"
        "errors-059132a15dd08d6704c67711dae0cf35ab991756.tar.gz::https://github.com/pkg/errors/archive/059132a15dd08d6704c67711dae0cf35ab991756.tar.gz")
sha256sums=("725fcd0c18890ae04fc0916996361f10bf0b4a68aa0267e3269226d663c33199"
            "03acc0555846d3a9da18928164dac4d31c87790ecff051452ec69f6b3dcebf87"
            "8432cb8b9817a271d4b2cfe8cb082ceb95fb83b3f6cfc3c295ada290b0b4c971"
            "9a13d19a4d014fa75182f3cb8c7ba36dcd58217e98728011c5e2df9c9a21622d"
            "1f9ef8e12aa12aecbb0ac256376cdb69268ba9d684421c7012f65f88422c5d9a"
            "8f64647986cb86b268dbfe463157c6b7e23f174243b0d29c9b0b15b22ea20f1a"
            "855ab42e2ac06e144a7da34844b23b88fa3f3e2e883c61d299ad8aa5fb9f536b"
            "445b111ceb1457339ffb04120a9450b96e4d5a186d6f8e3ccefa608b2185b379"
            "2544841b945d60209c21d48a2f50629efd82f4ba23deaf58be6b108b18878697"
            "893dd63e3e427e5f9944cfc9aa6726c57bcf0ed04f14351405d00a9c4d184281"
            "fd5bf933ebe3e754ca4f2229000c5b77fd7c253d05f4b6864507a203495b88b1")

prepare() {
  rm -rf "${srcdir}/gopath"

  mkdir -p "${srcdir}/gopath/src/github.com/Humpheh"
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/gopath/src/github.com/Humpheh/${pkgname}"

  mkdir -p "${srcdir}/gopath/src/github.com/faiface"
  ln -rTsf "${srcdir}/glhf-82a6317ac380cdc61567d729fe48833d75b8108e" "${srcdir}/gopath/src/github.com/faiface/glhf"
  ln -rTsf "${srcdir}/mainthread-8b78f0a41ae388189090ac4506612659fa53082b" "${srcdir}/gopath/src/github.com/faiface/mainthread"
  ln -rTsf "${srcdir}/pixel-7b509e1d7d67aee5f81cb01596299867d905d990" "${srcdir}/gopath/src/github.com/faiface/pixel"

  mkdir -p "${srcdir}/gopath/src/github.com/go-gl"
  ln -rTsf "${srcdir}/gl-55b76b7df9d25d70b63e31a767f47158292b85d8" "${srcdir}/gopath/src/github.com/go-gl/gl"
  ln -rTsf "${srcdir}/glfw-691ee1b84c51ae625ed1aafebc915d3db3d63d66" "${srcdir}/gopath/src/github.com/go-gl/glfw"
  ln -rTsf "${srcdir}/mathgl-cdf14b6b8f8a4a1bfb003dd5119205c5f711d85a" "${srcdir}/gopath/src/github.com/go-gl/mathgl"

  mkdir -p "${srcdir}/gopath/src/github.com/hajimehoshi"
  ln -rTsf "${srcdir}/oto-3a9bb05c78a0583c0f5a6c041eeb05a6ceec8ef9" "${srcdir}/gopath/src/github.com/hajimehoshi/oto"

  mkdir -p "${srcdir}/gopath/src/github.com/mattn"
  ln -rTsf "${srcdir}/go-gtk-ab259656e6a458c72e0a54a95b09df331b3bc20b" "${srcdir}/gopath/src/github.com/mattn/go-gtk"
  ln -rTsf "${srcdir}/go-pointer-49522c3f37914a12a6813caf41f4a9e84d39ca0a" "${srcdir}/gopath/src/github.com/mattn/go-pointer"

  mkdir -p "${srcdir}/gopath/src/github.com/pkg"
  ln -rTsf "${srcdir}/errors-059132a15dd08d6704c67711dae0cf35ab991756" "${srcdir}/gopath/src/github.com/pkg/errors"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  GOPATH="${srcdir}/gopath" PATH="${PATH}:${GOPATH}/bin" go build -x -i -v -o "${pkgname}.bin" "cmd/${pkgname}/main.go"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.bin" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _file in "${srcdir}/${pkgname}-${pkgver}/"*.md "${srcdir}/${pkgname}-${pkgver}/docs/"*.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
