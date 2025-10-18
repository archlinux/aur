# Maintainer: piernov <piernov@piernov.org>
# Contributor: Stephan Düsterhaupt <me at stephanduesterhaupt dot de>
# Contributor: Ivo Noack <ivo at insonic dot de>

pkgname=cuda-12.9
pkgver=12.9.1
_driverver=575.57.08
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit version 12.9 (Maxwell/Pascal/Volta support)"
arch=('x86_64')
url="https://developer.nvidia.com/cuda-zone"
license=('custom:NVIDIA')
depends=('gcc14' 'opencl-nvidia' 'nvidia-utils')
conflicts=('cuda')
replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk' 'cuda=12.9')
optdepends=('gdb: for cuda-gdb'
            'java-runtime=8: for nsight and nvvp')
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/${pkgver}/local_installers/cuda_${pkgver}_${_driverver}_linux.run
        cuda.sh
        cuda.conf
        cuda-findgllib_mk.diff
        *.pc
        fix-glibc241.patch
        fix-glibc242.patch
        4972.patch)
sha512sums=('fc29c5fc1121fb6634f1fe396abe7f34d351686454516269e9143e678ea178f906a35b916b8bb2d96ecfcfc705dda7d0f4547f7e7f00d36e392d981a766b6a56'
            '742a3eaea8574f09cd9aa9c820f2f93ba6272651a3bcadc4b274fe931ca7c19810e8322c38dc05c17fa2ed741851c813a5562604901b670bd76726718dcc57d6'
            '714d973bc79446f73bebe85306b3566fe25b554bcbcba2fcbe76709a3eca71fb5d183ab4da2d3b5e9326cb9cd8d13a93f6d4a005ea5a41f7ef8e6c6e81e06b5e'
            '41d6b6cad934f135eafde610d1cbd862033977fd4416a4b6abaa47709a70bab7fcf6f8377c21329084fb9db13f2a8c8c20e93c15292d7d4a6448d70a33b23f1b'
            '74772d4268e3af8d2b5ae58c1f4eefd1ddf9a8192befef8f481242ed1fb0c1791721329b984151be05dd56eadb28d86ecebe2cb4aaa2dba88d4783a9fd17b144'
            '5a1a292c387f30b567064e6d121a86b33f4582caed0144396b10a1b92a2aa9151e4e16367b0f4a0dd0d50bb77de9233e6ca69bb478810e8f7c1c062a90b13715'
            '6d746543d7761355bf05b0e18972a184131f938f97f16c8ff8209da49c6bfad4522c05bc2c52be92a944791828298daaad8990ec6f5de895611e8de5bb2cc786'
            '281eb8c3fd68dc8f0fac90eed5a9a90c35891708e9328d20ffda876d2d5d50ac4b020d15a82567be4a35c427a349ca2fc10408077c2a9cfbafc0142bbd6971c7'
            'ec71d9cde381388d8fe3c081dd0dc3ec4a2497f3e6c532dfa7e0ede88698d2fe90bb766895dd64f1a62b2bfe5ec56f693c51d6a551aee16449291ea1d60483c5'
            '46d557de089b052a18275b2acdd17f02937ed57134297873e9377acf7fd801d8e1082cfe91e13e9be7bbbfbaa7c9fc28d75fa3df9837bcdeb909c55a3f00ae10'
            '31b43a6add5f55c07f28e967981e06fbffc9d6d9e50f9cfc2a92a37ad48423ad2e91d340f825acccbc504cee021910cfc649a03d42a565f7b0cd22b973b71415'
            'f6d952715c3bb1a20e4f4305db4f3d7210a7c7c551a0aedd28c859e6befea0a3306ea87dfcb78c8a591f2e8f25feacaec9880bb26c85eb774ee8935b0e2d8e8d'
            'd2a1bcaa69f2d209ab4b4adc3c40eab0fa83cbd7532cc3e103a58c5b38cfe3af55473b3f972358cf40f6b1e40a2de053d3f772f8b1376fa342a557290066ef41'
            'c9cda4e83553168b410eb8ef6d014485da0ebbb7406f7c183da0abd75801bb72262a46dc06c87ff922fa6dbd93becbf0ec4d5482859c47f35d906c1fffe3bcaa'
            '33d3fe79ff8802649b6493ad8e67165155e4c0fcf0fb2ed2f14a365539b29ecab778cb4306492867b2adc752e35f593a5d439b3e413f35ddd83555f7a3a7d895'
            '01bf42ba247b7fd095da6e3cdac2c03cb16ea83bfd0769b59ead807683b9d1bbdb18b78ef60849d9d0f1dc9bd75a672c33e35a879ce886ac5131b8cac75b00c8'
            '6ee4cbcbb778ef52a60b4dde58505a29a5ec2a614a18daa80c22d4bb2d513a821db3d3f5362067fbcd1454519dbecd2d8836c104496b346a6991883d6271167d'
            '353345b8a530b16e95e821dd4fa77718782df9717511a92074413e1568426eaf008abd8f87f80f4b8096ebdf4c4129f09cc0684164437479062d54a65cbdc68d'
            '044261ea562eaa91cb34d6344e8af1a2a4775c296119dec7a9a294c0a4d545fc47bb69f2220f29ed065da9c26cf42804785fb42e555c8286769ebff5fd1e38fe'
            '74a0f42e34d52d95641fa867fc02db07ce81b6c317ecc1039fcbb7481d889138d9d7bd1eb9fde1cccef26fc7de4eacee1c3cc8fb9905c05027c141cc50a1dd0d'
            '1cc7034d4f26a0416018dc514969e636c40fb667d75d277d1cb276a93ba913277a7490e91d4019855d64a617df80a67579955247ca1858be0c255ecc84d5e801'
            '1019306ae755ccfb8c0a09b725a5b15cf0f4178e7b4d2aa733f244f0724d31ecf73b52d78129e1abc0625df7138e6a9cb5bfb5d1fe137f4ac19b35790f38b9db'
            '1fcb2cdc48ea1dfb5b42e3706970587babf74d645fb0af9d1c1f73cbc6408fe17cbd43392623bd8f25bc4beb587455b7af6d462e862f6809a94c7f05300b0d3c'
            '12ac418eaa018ac57a0643dcf10187d8d465f1adf1904582871a88553ca433c0cf64ae13c55f2cbb35f904fd0b04b26f8c6c563e939962b8f810679468287df4'
            '581b816c08e8ea7de850f01579e9fb7ec023c93ea33a936ec2f178afed071db772d4638db5819c1ed9902bd299d690caeba86211af26917674b995e706b65e33'
            'bf93bd294febcf3f779fb757fed64dbb360a3e86e0bbc753e26f88c97a4c133311dd34e9cc33a5677f29c7d816440fff4495f0a6d1234ae9c6c19a8d0067dbc0'
            '7994842afe52ab8cd12e9cd15efaf7e28e5d6f7fff5e3bd4ac7c7f0efd9fb49ff7b760880f0155e09a481fb46d910dc3ebcd1597c0e97ef65b0c9e5e5f4d58e1'
            'c735e7ca9a43d955a5fc88995c6da78bc4e782807ee5f8ae47cc485e1b0de3a48b6869aab267ae4456ea2ff8a33e77b46b676e85eb6eebab1b76a78f05c8513c'
            'ed53dea2a2d2b9ddba1b3dafd61866f85e04b6b1bd1edd61942c6653fa611c2a81a9b78b81942d912b2cf64ccf3ed652c2028ea0bb212cbb2e3e9d42a85a6347'
            'c4f675309d8cd071fbb357c0727aeb88b2db08ba9e454b9b210c0cdf686bc01df374a4a7bd25a8e89f6203c64f3f25001c6137de2b0986f61aa7cfae576c90d7'
            'db83179b5e2c1f540582938a019a450dbba9e3016922dd04ec0b665466f25e768fa292a8cf9c165dda1a9d25b05f5619eae1dbaf415f474bbbd0d50de7633930'
            '3b4e1afb0b7094fca733344f626e9bd65945a4bb68fc920642ae909fea177993fc1daf2655fa470ecb77f87e08abd2c923becf175e4bc6b10770ee882948e70b'
            'ce0abfc5165b586c5f11b1f64f5f2af80d16a095fd737820c85ae6b86dd24ff4ffe954df97893d4a712e69dd0e67742ca13ea266018b25134c5a23dbf453c046'
            'c7c7dbb0e21cb2342ede4bf730fe1191d59879e03151707c5519f4cafb64f1f7fdc3211f9d451ca789ab362de67cd43c2d4e1e2a714c8537a601b36cb63cb5b2'
            '3976bed1772e30296ce6cbb2ea6dcfef0bcff067343987ffc6ac0adbb5457cd46db1ef286ac576512e606414e431d4f51507bb877f419b0ecfc554d338e54929')

prepare() {
  sh cuda_${pkgver}_${_driverver}_linux.run --target "${srcdir}" --noexec

  # Fix up samples tht use findgllib_mk
  #for f in builds/cuda_samples/*/*/findgllib.mk; do
  #  patch $f cuda-findgllib_mk.diff
  #done
}

package() {
  cd "${srcdir}/builds"

  rm -r NVIDIA*.run bin
  mkdir -p "${pkgdir}/opt/cuda/extras"
  #mv cuda_samples "${pkgdir}/opt/cuda/samples"
  mv integration nsight_compute nsight_systems EULA.txt "${pkgdir}/opt/cuda"
  # mv cuda_sanitizer_api/compute-sanitizer "${pkgdir}/opt/cuda/extras/compute-sanitizer"
  # rmdir cuda_sanitizer_api
  for lib in *; do
    if [ -d "$lib" ]; then
      cp -r $lib/* "${pkgdir}/opt/cuda/"
    fi
  done

  # Define compilers for CUDA to use.
  # This allows us to use older versions of GCC if we have to.
  ln -s /usr/bin/gcc "${pkgdir}/opt/cuda/bin/gcc"
  ln -s /usr/bin/g++ "${pkgdir}/opt/cuda/bin/g++"

  # Install profile and ld.so.config files
  install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda.sh"
  install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda.conf"

  # Install pkgconfig files
  mkdir -p "$pkgdir"/usr/lib/pkgconfig
  cp "${srcdir}"/*.pc "${pkgdir}"/usr/lib/pkgconfig

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Allow newer compilers to work. This is not officially supported in the Arch package but
  # if users want to try, let them try.
  # See https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#system-requirements
  # for official requirements
  sed -i "/.*unsupported GNU version.*/d" "${pkgdir}"/opt/cuda/targets/x86_64-linux/include/crt/host_config.h
  sed -i "/.*unsupported clang version.*/d" "${pkgdir}"/opt/cuda/targets/x86_64-linux/include/crt/host_config.h

  # Fix Makefile paths to CUDA
  for f in $(find "$pkgdir"/opt/cuda -name Makefile); do
    sed -i "s|/usr/local/cuda|/opt/cuda|g" "$f"
  done

  # As this was ported from the cuda arch package version 11.1 I'm not sure what to do with it
  # didn't had any issues so far on my experiments

  # NVIDIA has trouble with counting and numbering 
  # as well as the elusive concept of a SONAME so...
  # ln -s /opt/cuda/targets/x86_64-linux/lib/libcudart.so.11.1.74 "${pkgdir}/opt/cuda/targets/x86_64-linux/lib/libcudart.so.11.1"


  # Patch for compatibility with glibc 2.41
  patch -p1 -d "${pkgdir}" -i "$srcdir"/fix-glibc241.patch --no-backup-if-mismatch

  # Patch for compatibility with glibc 2.42
  patch -p1 -d "${pkgdir}" -i "$srcdir"/fix-glibc242.patch

  # Fix for https://github.com/NVIDIA/cccl/issues/4967
  patch -p2 -d "${pkgdir}/opt/cuda/targets/x86_64-linux" -i "$srcdir"/4972.patch --no-backup-if-mismatch
}

# vim:set ts=2 sw=2 et:
