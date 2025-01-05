# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=18.2.4
pkgrel=5
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR LGPL-3.0-or-later')
options=('emptydirs')
_artifact=v${pkgver}-${pkgrel}
_ceph_libs_packages=(
  ceph_{common,compressor,crypto,erasure}
  lib{rados,cephfs,rbd,rgw,cephsqlite}
  python_{ceph_common,rados,rbd,cephfs,rgw}
)
_ceph_packages=(
  ceph_{tools,test,volume}
  ceph_{rados,base,mon,mgr,osd,mds,rbd,cephfs,rgw,node_proxy}
  cephfs_{top,shell}
)
source=(
  $(
    printf '%s\n' "${_ceph_libs_packages[@]}" "${_ceph_packages[@]}" \
    | xargs -I@ printf '%s::%s ' \
      "@_${pkgver}_${pkgrel}.tar.zst" \
      "https://github.com/bazaah/aur-ceph/releases/download/${_artifact}/@_linux_${arch}.tar.zstd" \
  )
)
sha512sums=('9e5f245781c8a3b253d01197860f9ff1b7701f122fb5779da97634ee582fa3382e8681f72d64a231715de933f016cfcbbfe15afd70d5b955ac8af95d1626eb17'
            '06b31a1e0cccb1da20da6893c65dea84f38b064d3aeab050c96e500d240867ea039011366481a0649068bc8da43775ae9f1e68796751266c9c5594a3ee94795b'
            'f6bc0fa4cf6e250135accf35abcdfc31802d13f4554b8404d5fd23bf4f69dcf01b5ae2b3198239b05052d862c8f664bdb8dea928adc2f6556863c1d549d3b18c'
            '1ce1cf6eb0a66910639d27dfe704b242cc0561a3a92c3b5782817e8e097f911f9114d041da3b4798bf6ec731412bc931298023ebb1ac0a4054126441ff70dab9'
            'e1f15ed23a4d82ec29746a69e5d563c0810a593d9f3d45a324d16c48974338330b67a04d37a33893fd93cf85b18efa5f3f308e2c1f3b467fe5db9fe4f0fb0f3a'
            '272f0e062fa3dab35c73dda7058d003e15536d79771f12c04455caf3486fc0ff3710fc25e95c3c5167c29f38e44082baecce13087c8fa2b4e71c88bf2ce0fa78'
            '8be555c5f29d9e194c07c54a436343b35191d9c9b68868334031ba64af446dee8753c4c3434a81b054c21a9973979b069d2c91ecde17efcfd6778303356c47ec'
            'b99303a4fa1af540f8a43adb584bcfd681991fa4381c69b28408cae1df14d61c0d9399275420d07aff3006d880b67a5ee65b571f9e9a72bc8f8a7904e838b4a5'
            '7eef3f9a989f7bd5fe3ad72c4e7f85686e28f20ce342048be160cdcf7244a1e6bb0b2b851cf7a1ca06a3771d1358947df5ff3c08c006ffb15e1b76f60346e879'
            '9810bbac0259cf8d4e2df1c8046919fb36f235a92aab5274db7b46ac2ffdc9f65af2c567ff1c10edf5d8259fa5f49b44c205dbd0d62a416ed92b45c50393c7a8'
            '1948b31fbd798d85af6db8df400e4c6fc9427dc41a62722cc6a58668e1f02a2f3ea15873a26d968cda2ed7b31d0c7564bf5a5073b77e75366a89b90949899a5d'
            '4f32aa9266f78be5a4de5b753bc15f98004a294bbd3cc4677a63adb3f1d16b623842e46218cba5dfea89efebafd4af77af475b0663eab327b0fb311cb1aa6107'
            'd2b4db2e9d473b5304c7440356e8860217f5cd0573f2dad735f0b9e9ed9cb0a3f7b9565d5bea1fc30b5740531d18b4098d32297089a63d60f8bbbe1fb90d104d'
            'b2947090193af1c652461e6458ef0ef54a0b5d828d5a89e7d23056b4a0b0e25eac4f9fe73f2d4731aec7e24ed6c6878ef535d5b07acf66dbb4b41cf87794df62'
            '651b5fc5f8f74d19fea43f15a221626916e4c2b1103162a701957428dd657a5577d2211337c6bc50e4709f2bc7b737f1c59df0cc9e7d13684a85e07c2a96cc23'
            'a6465977db1c7e4850fa28563fdc40cc0ed30570e397c3a02faf6c2f6316d4301a441e8af7a1e1549cf675f8382b85141ea5c4dc16c911a30af51fe9a5b15054'
            '1573d3972dd0596a56a60c23a8dee520fa481f44208b489fb954cb6b976229e6b765d604ea6939448b3660296d255bb6ec65ae16f40fbf3ddc2544eb9dd671c4'
            '77f7a796a55d486de1c8732743a561b4986644cf4021be22851123cbd130f476967672860fb3cc89d3e0555e27ad68951012aeccd2976c1d0345b95938e06041'
            'cef15645fe0b118dc6292f7cb778a8f717e93fe73faebb54ec402967066b7990aad50f7270bae1783de1421dceb81cd74c5fd9a743309882c653f7fcf9e6b77e'
            'fb06fff319c6049d7a02ca7a9ad865e3bf20ab0afb3bdad6e41d3d18fde87c5c098fb00212db24058edacc13ece41128c33c2b9748e39c1f47b174373d8a0ede'
            'f37139e02b1937d331cefa6ae4e7a3c4c81664f5bdf130c36596fd2404be4760baafd5c65d827a7e3eca35b9c865b6052286fb7ef5c8bd2cd1f5d32b44667787'
            '6eeaaf2fa9b448246c171d0c3dc200db77c94e244825d43ab301265aa7f3e79ebe582a99e19436451c8e1d34df045a7e89198a065671fe74ac31648ca17f3544'
            'c2099136547dc6f40357178b59253b741b44c4c740ed8c0ea33007f3f3ad828b5e47edd867807255d192bd103d24cbb9d1530ad63ae4f87f8ba23c7e37284729'
            'bec409829aaa1908ec090244afb9aaec6aa3607ee76c2e7cf2fe3b52802983f7439e80eb83e5cad576eee4c972980f35c0861dd5732ecfc63cdb998b0e22bcd5'
            'cc105ad422906cbd2a82b04657d6b87e2a920967adc44d2ba08e91c66a11f8f8ddd18f1724bd0a7b96182ce6eb3b9d712d8c7607ea6a5d7340f57394845f3745'
            'e63dcf75f60ae8d37b4b294d8fbd16f83755a33b14bdbd5b71075f0e849cdb62888313257c10d83b318cf703214848b65236e3a215bf547a52e560d67712db12'
            '1097813daaa1544e7398bccf358fb1ffa3baf15c1625b0e69b9cc881e876ed17ad40e6eaa00f3991c1cf846f252631b625d332b2462d1e5978fe17dafdbb3fd7'
            '768628dbd7b2d23e33387d18d268aa6450255c6e5627a8540d497c9743e360b04239df09e015591bf34d957ca7e71b7f83f3ad006499fd5a5425bf51c8110f32'
            'dc25e6a1180b48ed94290d3eb0d4c0a2619113b42257f01aefd6345dbc1e09eec5247739e7283a4086a937144af422f29bbf50a570fdb8070672db1e12aa4ae7')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua'           'lz4'                 'nss'                'oath-toolkit'
    'openssl'    'python'        'snappy'              'systemd-libs'       'zlib'
    'zstd'

    'python-prettytable'  'python-setuptools'  'python-yaml'
  )
  provides=('ceph-libs')
  conflicts=('ceph-libs')

  cd "${srcdir}"

  local p ; for p in "${_ceph_libs_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

package_ceph-bin() {
  depends=(
    "ceph-libs-bin=${pkgver}-${pkgrel}"

    'bash'     'boost-libs'     'cryptsetup'     'expat'           'fmt'
    'fuse3'    'gawk'           'gcc-libs'       'gperftools'      'libaio'
    'libcap'   'libcap-ng'      'libnl'          'librabbitmq-c'   'librdkafka'
    'lua'      'lvm2'           'oath-toolkit'   'python'          'snappy'
    'sqlite'   'systemd-libs'

    'python-bcrypt'     'python-cheroot'     'python-cherrypy'            'python-cmd2'       'python-colorama'
    'python-coverage'   'python-dateutil'    'python-importlib-metadata'  'python-jinja'      'python-jsonpatch'
    'python-packaging'  'python-pecan'       'python-prettytable'         'python-pyopenssl'  'python-requests'
    'python-scipy'      'python-setuptools'  'python-typing_extensions'   'python-urllib3'    'python-werkzeug'
    'python-yaml'
  )
  optdepends=(
    'smartmontools: disk monitoring via S.M.A.R.T'
    'nvme-cli: disk monitoring for NVMe drives'
    'cephadm: Required if cluster is managed via cephadm'
    'python-kubernetes: For mgr/module:rook,k8sevents'
    'python-numpy: For mgr/module:diskprediction_local'
    'python-influxdb: For mgr/module:influx'
  )
  backup=(
    'etc/logrotate.d/ceph'
    'etc/udev/rules.d/50-ceph-rbd.rules'
    'etc/sysctl.d/90-ceph-osd.conf'
    'etc/sudoers.d/90-ceph'
  )
  conflicts=('ceph')

  cd "${srcdir}"

  local p ; for p in "${_ceph_packages[@]}"; do
    tar \
      --exclude='.*' \
      --zstd \
      -x -f "${p}_${pkgver}_${pkgrel}.tar.zst" \
      -C "${pkgdir}"
  done
}

# vim:set ts=2 sw=2 et:
