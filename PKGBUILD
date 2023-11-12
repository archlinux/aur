pkgname="figma-linux"
pkgver="0.9.6"
pkgrel="0"
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
arch=("x86_64" "aarch64")
url="https://github.com/Figma-Linux/figma-linux"
license=('GPL2')
sha256sums=(.)
source=("figma-linux.desktop"
        "24x24.png"
        "36x36.png"
        "48x48.png"
        "64x64.png"
        "72x72.png"
        "96x96.png"
        "128x128.png"
        "192x192.png"
        "256x256.png"
        "384x384.png"
        "512x512.png")
source_x86_64=("https://github.com/Figma-Linux/figma-linux/releases/download/v${pkgver}/figma-linux_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/Figma-Linux/figma-linux/releases/download/v${pkgver}/figma-linux_${pkgver}_linux_arm64.zip")
makedepends=("unzip")

package() {
  cd "${srcdir}"

  install -D "${srcdir}"/figma-linux.desktop "${pkgdir}"/usr/share/applications/figma-linux.desktop
  install -D "${srcdir}"/256x256.png "${pkgdir}"/usr/share/pixmaps/figma-linux.png

  for size in 24 36 48 64 72 96 128 192 256 384 512; do
    install -D "${srcdir}/${size}x${size}.png" \
               "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux.png"
  done

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -rf ./* "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/figma-linux" "${pkgdir}/usr/bin/figma-linux"
}

sha256sums=('21def936e0a912743e4f6b5832b7c59ff5437538f93b372ff1f2949d35579dc4'
            'c94eaaf01a82688ab7951ea1d1085f50c3ebed588993d68c173139db848b21c6'
            '40b456b40c557395b1d9cedd035c7d14a169f8207d60441177e1f3c0582768da'
            '72d0c9df5b81a7666a05751a38fe096f629096be73792355f6069024cf7c0412'
            '780219a3792c5c4160829e7a8023e16f78e12c807762d7217a9db90e43a3f777'
            'c00c6751c90b394fc7bca51e5c6f139f16843d5f9f425b4ba31627dbaffaf0f9'
            '8d8f214d2e1f8e3816bbcf1262b273bedd56f1504326a2d54b2a1ba6cede63de'
            '86f34a8d9ddfdcfad5cc5e170a729cee7bca61102fbe0b10746b7f83b19d45bc'
            'f31ecf744bcf883a10656568aa3e3d5e9efa5c705d54803a3e58fe768d30006a'
            '1db635df7d84f73694303eba423acd75da892e084cf35c4e260bd5c6b56fcc1e'
            '5dc381da3bb02e5bc9d60cdbae3e3c5c8f249a83b4ef606721bb87559d0a122b'
            'e77bf9e7c699a53e69ba4a025e31ccf2b0a3b4c86acc842f7d0ecf1f8fe71ac2')
sha256sums_x86_64=('e3944f5a1fe769c1977af7a509acba22598f60189ac45befbab63569f27c9727')
sha256sums_aarch64=('9960718f5950b87311e98146da22fa2ace2cc023c5f193e60d0b3d577b3f411e')
