# Maintainer: colemickens <cole.mickens@gmail.com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.11.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes')
source_x86_64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.0-00_amd64_24f580dcc7cb8cb8439da40c2e1488f1851dac9dfaac0b64b94492538e59f948.deb'
)
source_armv7l=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.0-00_armhf_6ba891878207c8ae0588ff60a0e7ce96654c69817f84b4c99de9a8c285c719f5.deb'
)
source_armv7h=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.0-00_armhf_6ba891878207c8ae0588ff60a0e7ce96654c69817f84b4c99de9a8c285c719f5.deb'
)
source_aarch64=(
  'https://packages.cloud.google.com/apt/pool/kubelet_1.12.0-00_arm64_2dc185a17dabf63928bb6094f4025e5fa8a00da36af7fa9eb98cf0ca3f389df4.deb'
)
sha256sums_x86_64=(
  '24f580dcc7cb8cb8439da40c2e1488f1851dac9dfaac0b64b94492538e59f948'
)
sha256sums_armv7l=(
  '6ba891878207c8ae0588ff60a0e7ce96654c69817f84b4c99de9a8c285c719f5'
)
sha256sums_armv7h=(
  '6ba891878207c8ae0588ff60a0e7ce96654c69817f84b4c99de9a8c285c719f5'
)
sha256sums_aarch64=(
  '2dc185a17dabf63928bb6094f4025e5fa8a00da36af7fa9eb98cf0ca3f389df4'
)

package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "./usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
