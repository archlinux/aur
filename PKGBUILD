# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata-containers
pkgname=(
  kata-agent
  kata-ksm-throttler
  kata-runtime
  kata-proxy
  kata-shim

  kata-linux-container
  #kata-containers-image
)
pkgver=1.11.4
_pkgver=${pkgver/\~/-}
pkgrel=2
pkgdesc="Lightweight virtual machines for containers"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go<2:1.15'  # thanks Intel, love you big time: https://github.com/kata-containers/runtime/issues/2982
)

_gh_org="github.com/kata-containers"
_kata_kernel_ver="5.4.32"

source=(
  "agent-${_pkgver}.tar.gz::https://${_gh_org}/agent/archive/${_pkgver}.tar.gz"
  "ksm-throttler-${_pkgver}.tar.gz::https://${_gh_org}/ksm-throttler/archive/${_pkgver}.tar.gz"
  "osbuilder-${_pkgver}.tar.gz::https://${_gh_org}/osbuilder/archive/${_pkgver}.tar.gz"
  "packaging-${_pkgver}.tar.gz::https://${_gh_org}/packaging/archive/${_pkgver}.tar.gz"
  "proxy-${_pkgver}.tar.gz::https://${_gh_org}/proxy/archive/${_pkgver}.tar.gz"
  "runtime-${_pkgver}.tar.gz::https://${_gh_org}/runtime/archive/${_pkgver}.tar.gz"
  "shim-${_pkgver}.tar.gz::https://${_gh_org}/shim/archive/${_pkgver}.tar.gz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.sign"
  #"http://mirrors.evowise.com/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz"
  #"http://mirrors.evowise.com/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz.sig"
)
sha512sums=(
  e0af374e279899a010ab66ed4fd4caff33c91d2cc19711f5e51302041cd49e69a71909d71092042bf0c4070acbbc5421f5c6cca49c55a4c332c060e745cf5a0c
  326fe4e74313110b7afd4a701946ac90808ecd02643656cef27a180d5d47645e4bad5ede3ba9fb29cbfce1a691fb10d2136485fff4bcc651192c28e795102e43
  b8f8998229e2f12491cf6f9262cf8889353e83c58e93010ca3f328f77b61f89fb33d9209b21a1babae406f60b915011edb0832b803dd31b32115dfffa1b2edb1
  867f8fbf9c589535a10696a14c26aa6b9b3c6344690105489d55ed1287bdbd56909eb8052a22b4be98e8eb697fc57021212780ff41e478438c71a5c20d7446ad
  e19619110b4162e22bc4fa6c17330d9d77519a015971acbd8101ef9b4fbab728eb5779dc8c98c77e99a9a6355ce09408b37ecd440cef24ff8bb3e2e3156ef160
  f5b932d19b13a6150037d4929038142e218e752bf8cd52bf5a19b29abcf0bb377683ba84c9412b5f744549099d12ba82c2a35188230af759991ffff5eca7bce1
  8632772e67c2e045a9363eb00af3309632a5b15b8afe12a1756ae74fa484a0e7f9293b019355f483c6771a9294e09d518d40f34d15c114a0ca2bca90712171ab
  197f292fa541031071b8ed64880a3d4251fa65059747cbdf3900b8f934d17f681b506ca5f70132899bdef343d2d249a7902215d2ea04af5410599f1e50d6cbac
  SKIP
  #24044fb5a9870dbe13ec7eafb60d99e664cec10d50d80a73a0445d1368c0fa95881003d92e0a1c0446f76c1bbe89b098f35ceffd0ef24e9beaa51f1a83494b98
  #SKIP
)
b2sums=(
  94e996c463f0c5517bc6d97af2cb0f1dbadccd7e5f2ef5c45ea15d1deb5af65770371f25a0b9421ba70fa50a0b8c22c7d5a443173515ad4c5db30c1fa72cd395
  5302020c94d0fe47ae605be048da8080e4aa9ab9ba8a669772ba4389240917e94d7ab61252b0866db17d471942ccefba9b4871b365f359b7d9d6fae3e70b801e
  6c30855fc7d5298dbe8c6b7e294edbf840e123083fecfa3d73d91e741dcca70af6ca0c10672eb6fa24dd886b3ebddccefcff943b4c816ce65c2f05588947660e
  6194835f2526a7b16e5b8ca97fb831fdfb78a951dec51c8640c8cff6efd5186ed051e717ff748af7913bdf339f5a69e1b5c9aff2d70c732a4876481ac6fb59ea
  f514bb42482fcdf54454cb6e2362a45a897f6e3cd748ebd1bab7d1fe4a0736ec27bfa07d8ccc7bd7b037c4cf097bb23ecd69b2f93d31f9028c8dafc28fecd39d
  4721581ccc2c4af854091dd60ef6134e7285672993c99a0e0f4932de422d887b197ad80176fbc1a2f4085dfe9ae8baf044ee0728a92b7aedbc02139e62e84c0c
  0625dc648f976b2aa0dc8b9a8b06eb0e25b043f68506861aa85888646648df347adfe7d1b94c24315315f6f81e1fb9c89d6f07102401b6eb2b4de8c818001d55
  0ac78d1eb97ce4689ccdab01fb1475d07f29a90251b44b05fcf030d2f9aa644ac9dbb1315c7fe1eb991ef1435b7f17669e2b4f66187e3404599a0f136d2b1a50
  SKIP
  #24044fb5a9870dbe13ec7eafb60d99e664cec10d50d80a73a0445d1368c0fa95881003d92e0a1c0446f76c1bbe89b098f35ceffd0ef24e9beaa51f1a83494b98
  #SKIP
)
noextract=('archlinux-bootstrap-2020.08.01-x86_64.tar.gz')
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # kernel
)

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

_kernel_prepare(){
  # kata-linux-container prep (ref: https://github.com/kata-containers/packaging/tree/master/kernel )
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  #for p in $(find "${srcdir}/packaging-${_pkgver}/obs-packaging/linux-container/patches" -type f -name "*.patch"); do
  #  patch -p1 <"${p}"
  #done

  # kernel config prep from upstream ("${srcdir}/packaging-${_pkgver}/obs-packaging/linux-container/kata-linux-container.spec-template")
  make -s mrproper
  rm -f .config

  _KCONFIG="$(find "${srcdir}/packaging-${_pkgver}/kernel/configs" -type f -name "${_KARCH}_kata_kvm_${_kata_kernel_ver%.*}.x")"
  if [ -z "${_KCONFIG}" ]; then
    KCONFIG_CONFIG=.config ARCH=${_KARCH} scripts/kconfig/merge_config.sh -r -n "${srcdir}/packaging-${_pkgver}/kernel/configs/fragments/common/"*.conf "${srcdir}/packaging-${_pkgver}/kernel/configs/fragments/${_KARCH}/"*.conf
  else
    install -D -m 0644 "${_KCONFIG}" .config
  fi
  make -s ARCH="${_KARCH}" oldconfig
}

prepare(){
  _kernel_prepare

  mkdir -p "${srcdir}/src/${_gh_org}"
  for i in agent ksm-throttler proxy runtime shim; do
    rm -rf "${srcdir}/src/${_gh_org}/${i}"
    mv "${srcdir}/${i}-${_pkgver}" "${srcdir}/src/${_gh_org}/${i}"
  done
}

_kata_image_build(){
  # rootfs and initrd build (it's horrid, but somewhat works)
  _ROOTFS_DIR="${srcdir}/osbuilder-${_pkgver}/rootfs-builder/rootfs"

  # build rootfs
  install -D -m 0644 "${srcdir}/rootfs-builder-config.sh" "${srcdir}/osbuilder-${_pkgver}/rootfs-builder/archlinux/config.sh"
  install -D -m 0644 "${srcdir}/rootfs-builder-lib.sh" "${srcdir}/osbuilder-${_pkgver}/rootfs-builder/archlinux/rootfs_lib.sh"

  cd "${srcdir}/osbuilder-${_pkgver}/rootfs-builder"
  GOPATH="${srcdir}" AGENT_SOURCE_BIN="${srcdir}/src/${_gh_org}/agent/kata-agent" ROOTFS_DIR="${_ROOTFS_DIR}" ./rootfs.sh archlinux

  # rootfs image (need to bypass root requirement somehow)
  cd "${srcdir}/osbuilder-${_pkgver}/image-builder"
  ./image_builder.sh "${_ROOTFS_DIR}"

  # initrd
  cd "${srcdir}/osbuilder-${_pkgver}/initrd-builder"
  ./initrd_builder.sh "${_ROOTFS_DIR}"
}

build(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" LDFLAGS="" make

  # kernel build
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  make -s ARCH="${_KARCH}"

  #_kata_image_build

  for i in ksm-throttler proxy runtime shim; do
    cd "${srcdir}/src/${_gh_org}/${i}"
    GOPATH="${srcdir}" make DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  done
}

package_kata-agent(){
  cd "${srcdir}/src/${_gh_org}/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-containers-image(){
  #install -D -m 0644 "${srcdir}/osbuilder-${_pkgver}/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/kata-containers-image_archlinux_${pkgver%%~*}_agent_git.img"
  install -D -m 0644 "${srcdir}/osbuilder-${_pkgver}/initrd-builder/kata-containers-initrd.img" "${pkgdir}/usr/share/kata-containers/kata-containers-initrd_archlinux_${pkgver%%~*}_agent_git.initrd"
  cd "${pkgdir}/usr/share/kata-containers"
  #ln -sf "kata-containers-image_archlinux_${pkgver%%~*}_agent_git.img" "kata-containers.img"
  ln -sf "kata-containers-initrd_archlinux_${pkgver%%~*}_agent_git.initrd" "kata-containers-initrd.img"
}

package_kata-ksm-throttler(){
  cd "${srcdir}/src/${_gh_org}/ksm-throttler"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
  install -d -m 0755 "${pkgdir}/var/lib/vc/{firecracker,sbs,uuid}"
}

package_kata-linux-container(){
  install -D -m 0644 "${srcdir}/linux-${_kata_kernel_ver}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kata_kernel_ver}.container"
  cd "${pkgdir}/usr/share/kata-containers"
  ln -sf "vmlinux-${_kata_kernel_ver}.container" vmlinux.container
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${_kata_kernel_ver}.container" "vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  else
    # param out bzImage for other archs?
    install -D -m 0644 "${srcdir}/linux-${_kata_kernel_ver}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  fi
}

package_kata-proxy(){
  cd "${srcdir}/src/${_gh_org}/proxy"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-runtime(){
  depends=('qemu-headless' "kata-proxy=${pkgver}" "kata-shim=${pkgver}" "kata-linux-container" "kata-containers-image")
  optdepends=(
    "kata-ksm-throttler=${pkgver}"
    'firecracker<0.22.0'
    'cloud-hypervisor<0.8.0'
  )
  install=kata-runtime.install
  cd "${srcdir}/src/${_gh_org}/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}

package_kata-shim(){
  cd "${srcdir}/src/${_gh_org}/shim"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib"
}
