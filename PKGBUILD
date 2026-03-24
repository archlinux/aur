# Maintainer: Findlay Feng <findlayfeng@gmail.com>

_target_arch=(
  'aarch64-zephyr-elf'
  'arc64-zephyr-elf'
  'arc-zephyr-elf'
  'arm-zephyr-eabi'
  'microblazeel-zephyr-elf'
  'mips-zephyr-elf'
  'or1k-zephyr-elf'
  'riscv64-zephyr-elf'
  'rx-zephyr-elf'
  'sparc-zephyr-elf'
  'x86_64-zephyr-elf'
  'xtensa-amd_acp_6_0_adsp_zephyr-elf'
  'xtensa-amd_acp_7_0_adsp_zephyr-elf'
  'xtensa-amd_acp_7_3_adsp_zephyr-elf'
  'xtensa-dc233c_zephyr-elf'
  'xtensa-espressif_esp32_zephyr-elf'
  'xtensa-espressif_esp32s2_zephyr-elf'
  'xtensa-espressif_esp32s3_zephyr-elf'
  'xtensa-intel_ace15_mtpm_zephyr-elf'
  'xtensa-intel_ace30_ptl_zephyr-elf'
  'xtensa-intel_ace40_zephyr-elf'
  'xtensa-intel_tgl_adsp_zephyr-elf'
  'xtensa-mtk_mt8195_adsp_zephyr-elf'
  'xtensa-mtk_mt818x_adsp_zephyr-elf'
  'xtensa-mtk_mt8196_adsp_zephyr-elf'
  'xtensa-mtk_mt8365_adsp_zephyr-elf'
  'xtensa-nxp_imx_adsp_zephyr-elf'
  'xtensa-nxp_imx8m_adsp_zephyr-elf'
  'xtensa-nxp_imx8ulp_adsp_zephyr-elf'
  'xtensa-nxp_rt500_adsp_zephyr-elf'
  'xtensa-nxp_rt600_adsp_zephyr-elf'
  'xtensa-nxp_rt700_hifi1_zephyr-elf'
  'xtensa-nxp_rt700_hifi4_zephyr-elf'
  'xtensa-sample_controller_zephyr-elf'
  'xtensa-sample_controller32_zephyr-elf'
)
pkgname=("zephyr-sdk-gnu-bin")
pkgver=1.0.0
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')
conflicts=("zephyr-sdk" "zephyr-sdk-bin")

source_x86_64=()
source_aarch64=()
_depends=()
_provides=()
for _target in ${_target_arch[@]};do
  pkgname+=("zephyr-sdk-gnu-toolchain-${_target}-bin")
  pkgname+=("zephyr-sdk-gnu-${_target}-bin")

  _depends["${_target}"]="zephyr-sdk-gnu-toolchain-${_target}=${pkgver}"
  _provides["${_target}"]="zephyr-sdk-gnu-${_target}"

  source_x86_64+=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/toolchain_gnu_linux-x86_64_${_target}.tar.xz")
  source_aarch64+=("https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${pkgver}/toolchain_gnu_linux-aarch64_${_target}.tar.xz")
done

sha256sums_x86_64=('4015c637d21348db36bb31e849a00bcbccc02304feef519b897d0b83ce759760'
                   'bc482ed209332bd5d38fa6851ca3c61daad60e6f74afe4403df476a7f97fa8b4'
                   '2a97a5059e1e088f251bd15bfc1fd11760376b00e83b18803a4389538d63982e'
                   '4b467e2fb26307b464915d0c9a87e47ab4d94d560888f239a76eeb56b4d9011f'
                   'd828dc94942c41cf8efec86f14bac23389490aa03b69b2096d07fa27138ee822'
                   '711236aada9b153f4fc62d971206915a513913347b235062f24a6935e59419f3'
                   'ae40cd62aaaa5ffa3d28964d5847ef4934bf816840f6f8599cd268dedeeb9d82'
                   'cbaa4083b6161d79de10b0aa46a3c29d1155cb1ce9b66d03c6d68d494495deda'
                   '19e5f36b0546a5a38351cbee29583dd8bf592c13283f32d7a0d8af89a9e4b6c7'
                   '8cdc43009f4e94af30e6e3881c67a57b2a01cda711dfc8ac52892ed0939604bd'
                   'a28ef64772041438f3a4b7c427855a370c2f257aa74479ec675856ab162055e0'
                   'e9ea0e349c7163e6a9de4c4867869eeab2ae52f20d07f24b464b8819579a695f'
                   '2b57f5481964c442869b38c62e51ec3898dabae7aac2d574b31a42e51f7133a5'
                   'fa40315742ee83948324de1840017063f587bdd51589d64cb2b61db8c2cda580'
                   'd3cc482c4b4920bbaf608224fd203254d2df352bf42b14f11b626fbabd71306a'
                   'aa83ea8adb9caaf2e6ff7a44a12901aefef58a9d7f18f1c0740a3ab50e3da031'
                   '380aaf0d033042edaf7ab091eb4ac7b958f89745181e4d389d5be49f95ec7189'
                   'd7be69d2b58d857dfb9807ab7debbbc0e65b4439d165ac15d6e731b082788cc9'
                   '9255f792bbddb966bbc84c8332cd8a25eb89300a3b8a9ff462b09c2e53200c23'
                   '3781cdf5be2bce9982095e73b6f0f6414eb896e6b9dfaa7cd673a38c0ed78f5b'
                   'b25ca387c27446c071aaacea0f389d4401e7ed38c602ae482e151fd65bcd4276'
                   'cff8110a92cee39d83de0abd3979387c4f7e17e996d9040c0d36f6a7423404a7'
                   '91c8a5b0f74ffbacc918786d4d4836344f4471f87c70dbb21d9cbe91372df27f'
                   '37357aca503c76a0235d7fd190138c46a7c8b1c1ee22dac60b4c3c8eec6c87df'
                   'd774a119af3316bb6f485e170778b4def457671a88944fc6b379e999033c296c'
                   'b335861b7a12ab559cd3d1faa8a69aef4269ccf8d3aada6632bf00aace84f04d'
                   'e197ad98bea5cf554cdb624c26c650ef5df8ecfc7e53027b902dcf48e122dc33'
                   '9ee2fa9f27bb271824a25f971b9891144cf0c2bc3bca0ecc35174f45aa329559'
                   '71c4a8ffe5d39c83b86eab305e57cb336af4bc697cc4f8904bc316e828bc5613'
                   'dea54a22662ea26349b42c024c40d4d7077ffed60eb3523bf4e0528ded7a4162'
                   '708da8e7d5efbeaa140e93fef770fb4084d322b5e068af04ba05a819c0924883'
                   '85b4ad999b5692b53abdfa43ed05cb8c81da7ca14ed65113fc2b02c90cc1c417'
                   '069dce6ec36b7898fe3ef7de255b8f6dedfc4b1d5cf89c7d041f10f8bc89ff2a'
                   '8c72565bde65a2c2eddb012b2266a42ad3daafe9a33c2187482da22602c58850'
                   'ee0afc7543add7d677278ba9ff8ec714cfa50c210f96f2f64efe7d9933df8693')
sha256sums_aarch64=('7e8a147601d9141df70c19371fa40f75157ed21158723226b143034711f993fd'
                    '7e1a4862dd2bf2102cb6e3fbcee67b5c978bb794bdbb0e6a99ba3b6de541f2bc'
                    '228fe7d8de460c529caae46bd3ded7c6730168e5549483d22c35ccda44d8e5c2'
                    'b6c86caea4bee012943217f3e6050e6e56c78000b6e87dbb9ded4a290dce3573'
                    '65863ca4ad393e38382450c34963840f3d86a27012276c33b0d5917ab62485e6'
                    'f76b3ef1090361eeb0002150a13d8faabbdfc4215e508f6ece26005d5c6232e0'
                    'bd81fd0bd07f0616c0b3b3dd8b985730ee1964d00ce474d190708fbc05b26892'
                    '2d2519b04aabe90001405bd2114449d23586e0a424e44d78de1b54b9463c4959'
                    'd838eee035875bb4521bbed48e3f31e11e9543a1af1519d48b23179141c8b67e'
                    '3b20f550d2dd29c88547dddc91e3bd9214dc5d5ef10ab31c0780963c11a09212'
                    '509f23ad992b2c1013de2820dcd49cca54e2b403a2b0d77073e154733323f9cc'
                    '68d8c8cee7eef35a9989112eae8d1b286c76f2d9e38c613883280e9a7dda226b'
                    '1a091c53137b1b8526ad0548ae11907e3d5928503500b1f80216384bc3c8187f'
                    'd615593cb825c81c4487ee33c1d736d3b0fdc339db2e398c59a4f13bb6681032'
                    'ecddfe400a69d8c10f30b0b18f9d86f58bad08e1e35b908ce6ee024225f276b2'
                    '30caad0bf6a83403a6ddf4b5a626e8f77181fa162f0549e93963a7312b9d2053'
                    '613bd543d0ba57a2c75555f6ce1f73b1f1a23d7d57ffe2c864978c9cb8509fac'
                    '56370802ea4f7afa671cdd6c1b38f9d18f10f35fbde5cd977a5519d8e5f1bb3c'
                    'c26b4799c410e5fd46a429e4bfa66fb483e029ec3a6c58cf51f76120bdafaa32'
                    '65c90739f23f6bd8487a9273f415c7c006b889964056e164bdca0a6aefac184b'
                    '9102f7e5aeec56959b0ef978ec58573b5fb7f1f71d66cd9a2a67e5888c58b1e6'
                    '3126c3a71b6b06ca3ec12df43c2efcef575f60f60d646a13c78009b5caf39730'
                    '9d299d8e14b7c0d6b6b263d3f7d5b8d1398a4926443cbd53e702dd289fe23602'
                    '2666bc95cfc3c22d055580ca45104bb68617dcd22395178c8dd31c59ad3036bd'
                    'dfc3b16bfef1c6684c8fe92280bac50d8a203b38dc1d9051ea9a7c62e59ab849'
                    '6290a0c2a75cddfd4b98852abbd8ca49408333a373c5f44991167618bc5fd107'
                    '316f63fa691da475e34a54247ad87e94cd8c07ad012d0ec94aa22944aee59343'
                    'f4772f409ea41fae088b8dce1243f1a56a5f65e2a9533eb1a04ef0280d79b573'
                    '823c69d3d679fd6af9c10d7afa6efe40c19266a36dcc58c1c7aabb5bcbf047db'
                    '490380d8412b7a8bb0824181f4b9448f8b48b873c37d82cfae17c261e76968ce'
                    'da6e7f4f42151e7794175ee87dcd6b580c698e91b96a551df46f7a92dfa120e6'
                    '2076404175d772c52c0620d4882f2784c1192d7c5aec1133ea4e6ba6431404cf'
                    '3efaa5d83895ae4bef6d5033c1a51020d6941d074bfed26636847e8dc068dea4'
                    '8140b3e235e4b0828b5e0e9c268063ece19402ff0f7dd29bfb1f8a6b72521754'
                    'ba22e1bf6ea8486ec0fdf7848f37dd5dd2803cbf8069c25f8eaebbd4b7c8ec56')

options=(!strip)

build() {
  cd "$srcdir"
}

package_zephyr-sdk-gnu-bin() {
  depends+=('cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz'
    "zephyr-sdk-cmake-modules=${pkgver}" "zephyr-sdk-profile=${pkgver}" "zephyr-sdk-hosttools=${pkgver}"
    ${_depends[@]}
  )
  provides=("zephyr-sdk" "zephyr-sdk-gnu" ${_provides[@]})
  replaces=("zephyr-sdk-bin")
  optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
            'pyocd: programming and debugging ARM MCUs'
            'python-west: Zephyr RTOS Project meta-tool')
}

_package_zephyr-sdk-gnu-toolchain-TARGET-bin() {
  local _target="TARGET"
  provides=('zephyr-sdk-gnu-toolchain-TARGET')

  cd "$srcdir"
  for f in $(find $_target -type f -printf '%P\n'); do
    install -D $_target/$f ${pkgdir}$_installdir/gnu/$_target/$f
  done
}

_package_zephyr-sdk-gnu-TARGET-bin() {
  provides=('zephyr-sdk' 'zephyr-sdk-gnu' 'zephyr-sdk-gnu-TARGET')

  depends=(
    'cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz'
    "zephyr-sdk-cmake-modules=${pkgver}" "zephyr-sdk-profile=${pkgver}" "zephyr-sdk-hosttools=${pkgver}"
    "zephyr-sdk-gnu-toolchain-TARGET-bin=${pkgver}"
  )
  optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
            'pyocd: programming and debugging ARM MCUs'
            'python-west: Zephyr RTOS Project meta-tool')
}

_package_gnu_toolchain_def=$(declare -f _package_zephyr-sdk-gnu-toolchain-TARGET-bin)
_package_gnu_toolchain_def=${_package_gnu_toolchain_def#_}
_package_gnu_def=$(declare -f _package_zephyr-sdk-gnu-TARGET-bin)
_package_gnu_def=${_package_gnu_def#_}
for _target in "${_target_arch[@]}"; do
  eval "${_package_gnu_toolchain_def//TARGET/${_target}}"
  eval "${_package_gnu_def//TARGET/${_target}}"
done

# Manual test procedure: get Zephyr Kernel, build an example, and run in Qemu:
#
# $ wget https://github.com/zephyrproject-rtos/zephyr/archive/master.tar.gz
# $ tar xf master.tar.gz
# $ cd zephyr-master
# $ source zephyr-env.sh
# $ cd samples/hello_world
# $ mkdir build && cd build
# $ cmake -GNinja -DBOARD=qemu_cortex_a53 ..
# $ ninja run

# Alternative using West:
#
# $ west init testws
# $ cd testws
# $ west update
# $ cd zephyr
# $ west build --pristine=always -b qemu_cortex_a53 samples/hello_world
# $ cd build
# $ ninja run

# Expected output for -b qemu_cortex_m3:
#
#       *** Booting Zephyr OS version 2.4.99  ***
#       Hello World! qemu_cortex_a53

# More info: https://docs.zephyrproject.org/latest/getting_started/index.html
