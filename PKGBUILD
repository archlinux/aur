# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

_major=11
_minor=7
_patch=1
pkgname=cuda-11.7
pkgver=11.7.1
_driverver=515.65.01
# _driverver=455.32.00
_reqdriverver=455.32
pkgrel=2
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('gcc-libs'  'gcc' 'opencl-nvidia' 'nvidia-utils')
replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb'
            'java-runtime=8: for nsight and nvvp')
options=(!strip staticlibs)
install=cuda.install
# See https://developer.nvidia.com/cuda-11-7-1-download-archive
source=(
  "http://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run"
  # "cuda-findgllib_mk.diff"
  "accinj64.pc"
  "cublas.pc"
  "cuda.pc"
  "cudart.pc"
  "cufft.pc"
  "cufftw.pc"
  "cuinj64.pc"
  "curand.pc"
  "cusolver.pc"
  "cusparse.pc"
  "nppc.pc"
  "nppial.pc"
  "nppicc.pc"
  "nppicom.pc"
  "nppidei.pc"
  "nppif.pc"
  "nppig.pc"
  "nppim.pc"
  "nppi.pc"
  "nppist.pc"
  "nppisu.pc"
  "nppitc.pc"
  "npps.pc"
  "nvgraph.pc"
  "nvidia-ml.pc"
  "nvjpeg.pc"
  "nvrtc.pc"
  "nvToolsExt.pc"
)
# To easily compute the hashes, run:
# sha512sum *.pc | sed -e 's:^\([0-9a-f]\+\)\s\+\(.*\):  "\1"  # \2:'
sha512sums=(
  "c2b40879a4903ed6d3201ea8c0d51fb0fdc21a27445f007aba1c9827add9a2d8326ccd764d324266d8f742a1c63aca9631158886b3de49899a864224517f1c03"  # cuda_11.7.1_515.65.01_linux.run
  # "41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b"  # cuda-findgllib_mk.diff
  "292e9eb7ca4ba7b76293ab38aeba74fbe4803af3bbb652cc1975fbae1150ecf018b92b16e4efa672d2a16a963e2eff7f06b809cf6541cba94a0ae1a57ff96e03"  # accinj64.pc
  "a360560f0eac3cf5075f760f251c933844c7d5652d759d7fb1b8de2bf240a2b15cdfea2acc4dc08d045ee2b512aa650468a480cdb2fd35a770ee2089d1587bc1"  # cublas.pc
  "143ea30f1aecea61c26b32b10ab82b7c39039ccca5b5fa9bc4dab0724fc0d7ce9080a8cd392a65b5d08c9717bb9be2dd662e8d94483c43414fa45b377586b64f"  # cuda.pc
  "9e1611cf4a4ed9daf023babbc7b9c162f247ac46a7df7420ffdabba7d46ccbf1736756325fd5fdef93be4ae23743da0292eef52dc1e6ed0237ab1e406d3ab4bc"  # cudart.pc
  "ef34326d87d810f3e2189095a36284477c6dd10eea7bd4e1f2ffdd7ca8a645cd6003001932db4b2b32f14751d9e14382bdb140b6095f2b9839eae1ef57dfe571"  # cufft.pc
  "7b81f145388fc3c3338ddae004edfbeaa2c7caf1b352deed346e4a56bb17f75762f22c9408f89c098f1ed3259d82afc52d0b6e3ce0b6facd376177b478ab2808"  # cufftw.pc
  "3f70a0cd0981f4139f636ba22a2b5001d8f6875ece4347d3011b2ee71df1ca003cd22f872dd06cccb71a3247fa13c6782e1d591dbfdd7c778f33c1e4a2225cfc"  # cuinj64.pc
  "47f7bfc836ac1a700e1f5b884715cdd3e55b16a881f7547942dd3b9579979ec891cd97ae1927aa60a6e5e01c337b74689aa70f1161a9b59fa3085817cea8826f"  # curand.pc
  "ee23346e4ec942f5da63a29e50beeb5ec16dea388e3f9e6b0ce356c397a386ad713374dbf44fa4b8e26ae6e9c21c64b576e349ac4735dbb2626e86dd26e06107"  # cusolver.pc
  "849c4951f21b2f77f32f8fd0b4850a2cc911d88359a5ee662a8155292e609660f596ae1b420282d7f0a7d847ea0602b9b5f501bafcb5784f495e5726c3a2c5f4"  # cusparse.pc
  "9ab313597aa8a28cd7d9a6405b7291f795c31aa44d24dad3018e23ab749e462cb5c4ae94dc6f8c9511e7041461687103a5673fb3cca8088504f20c30186cd032"  # nppc.pc
  "3ce95f181da8bcd6967f45963002aad1cdf4456079991d0f7dba922557ca732c9a7320a3059b7beb479be7c053e87edcad6676aa837d1ae372129afec769231c"  # nppial.pc
  "0f88e1012d5a01314c5f924dc07af3e4ddd7e5dc535a52f03706cfc124ead61068ed0d227f3aa946bba009fe89ec2897c19f46fb200ae903e6de49039a4053dd"  # nppicc.pc
  "c9a1c8ce42d6541f700f13aaa3271e6c7efa59e98607f06b9a653c2acb4b29532f83b0fdefcfb18d9bf53aba0fb853165534318f6c7962f7aa9f30c0524ec82b"  # nppicom.pc
  "c1ef9a2c1ad2d44bb982abc3b3eec606137a3da04ba892a0ba692d31df74a77956d9e8e29cafe16edcc95921c91bf632d205efd0a7a07f1c4667ee69134d7dca"  # nppidei.pc
  "017755ccdce093d1b9e75a54210ea7bffb69a3bde6314be8d679b24e6fe91500426f0780776ced57106fba12ad1a9794c655b886ed8956349b5936d56b1baf64"  # nppif.pc
  "1c69716c7396b1b15fe483089a927837d25c8a45c2a9fb6c50d4f5886c10fefae7232fa8a572636e04366d82ac1fb075b11c415ba6af35eb7f72e20a53aa16c3"  # nppig.pc
  "0bcad574ac149141fcd8fe69a53dfd734ed4f6f5720d15d5da76011e21c3c7e81ab1170dfcb55ad9164a23b4fa9d657ff4e82bc06787ba6afe01df746f309c11"  # nppim.pc
  "a88c1091c3243d055d2f7512ee4ac95a029e77f603cc854e125141403283597d8eee3de4b93f949f887ff5c6b4f6a5534c24279387d3602296f52c168dcbc240"  # nppi.pc
  "aeda4ae441520e9613f7653e7155112a8fe741b7db9ecfcdf35ea6cfea34167ea1de2a57d4552b0180c29d91b839831e3838632496a85555322abe07cd583551"  # nppist.pc
  "74396378d48203cebd3959bc5368db541098bd04fa3ffcf5fbd189f8086e2019da9eeeeb8c6e135d2e21806a33172d1236d95a3c72943b22576118d4b6ee0cf0"  # nppisu.pc
  "2dd99eeed24411f4fcb692198433e7c7c5e88ef732d3e4220ec27af9ee614ef11e0a8f7689542bf9729251ddce46c99eea6de2d3029ec9bf14779b492bfa4760"  # nppitc.pc
  "7d1174d6dfbad94bf50f5772e27312526540b5ee9d78c9fe6140743706e1920b590be63951ea416de31805f8ce06b41d75118bd5e3dd7f768cc2ef7a2471c935"  # npps.pc
  "0cd7a0fef0081af358de23a770beb973f9a10ecf1b8eca20c6be103178e978880923b65aa362dd604216797f302f45870fa383ecda2e562e9e10727be7b98bd2"  # nvgraph.pc
  "8fe36efd48dbfc4d12760d781f581b4dd6ef8737c4f95199f3a170133a7057f0d0b019bea9f2a1d4e927c1cedce31590fef0cf2d5c7441b51d49b755b42321d9"  # nvidia-ml.pc
  "4a509b6d39e8cd74b750fbf3a974b06b8e689a2422ea70e98233a6a4ad534a407401abf400b1fed71e8f91c2537ad84e46e712c5baefbde66eb95781fc19fbec"  # nvjpeg.pc
  "75b217236ac035e55340a2bad020cc8ee25dd976ae956ecfbd2ec7d373e427af8d025c0521d830cc830f6e958acdab7101d674eb35de559d716aa2194e831eef"  # nvrtc.pc
  "fd3412aa148f234d8e4704cd13698343da435b8b11c98cc46e43e67de6bcff036e2ca1eedd5d05cd7411b93d0fc594e4bacc55065f7f13dbe1f6e8274812d4de"  # nvToolsExt.pc
)


prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  # for f in builds/cuda_samples/*/*/findgllib.mk; do
  #   patch $f cuda-findgllib_mk.diff
  # done
}

package() {
  _target_dir="${pkgdir}/opt/cuda-${_major}.${_minor}"
  cd "${srcdir}/builds"

  rm -r NVIDIA*.run bin
  mkdir -p "${_target_dir}/extras"
  # mv cuda_samples "${_target_dir}/samples"
  mv integration nsight_compute nsight_systems EULA.txt "${_target_dir}"
  mv cuda_sanitizer_api/compute-sanitizer "${_target_dir}/extras/compute-sanitizer"
  rmdir cuda_sanitizer_api
  for lib in *; do
    echo "copying $lib/*  ==>  ${_target_dir}/"
    if [ -d $lib ]; then
      cp -r $lib/* "${_target_dir}/"
    else
      cp $lib "${_target_dir}/"
    fi
  done

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc "${_target_dir}/bin/gcc"
  ln -s /usr/bin/g++ "${_target_dir}/bin/g++"

  # Install profile and ld.so.config files
  # install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda-${_major}.${_minor}.sh"
  # install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-${_major}.${_minor}.conf"

  # Install pkgconfig files
  mkdir -p "$pkgdir"/usr/lib/pkgconfig
  for file in "${srcdir}"/*.pc; do
    file_name="$(basename $file)"
    cp "$file" "${pkgdir}"/usr/lib/pkgconfig/"${file_name%.pc}-${_major}.${_minor}.pc"
  done

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda-${_major}.${_minor}/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${_target_dir}"/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${_target_dir}"/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$_target_dir" -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda-${_major}.${_minor}|g" "$f"
  done

  # NVIDIA has trouble with counting and numbering
  # as well as the elusive concept of a SONAME so...
  ln -s /opt/cuda-${_major}.${_minor}/targets/x86_64-linux/lib/libcudart.so.${_major}.${_minor}.${_patch} "${_target_dir}/targets/x86_64-linux/lib/libcudart.so.${_major}.${_minor}"
}

# vim:set ts=2 sw=2 et:
