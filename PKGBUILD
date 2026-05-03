# Maintainer: Paul Stemmet <aur@luxolus.com>

pkgbase='ceph-bin'
pkgname=('ceph-bin' 'ceph-libs-bin')
pkgver=20.2.1
pkgrel=3
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='https://ceph.com/'
license=('GPL-2.0-or-later OR LGPL-2.1-or-later OR LGPL-3.0-or-later')
options=('emptydirs')
_artifact=v${pkgver}-2
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
sha512sums=('fbc1ff438a2010de2671838a8afa076bb1e9ae37406e4a5db205c8353b62358534f0800ec38af68010f46ea8d86ff45a46194e3545ce8735f996b5a1ba12eaac'
            '0ce94e6ea30554c783602c3e94d9406a27a83eb62eaaa6ca71cda9f5ca983c02df13d42e0028fab3e2fc2f264af67c49c5100a0487ab2da73dd412f507c87b48'
            '6f522b3b1348b094fa768870c3651ceeb03b9bd90acddf114dc8e357dc575d37ed930bd6b6290454ac874bc05376ddd32cfc02169efd1aed6b9b778d6538d736'
            'e4e711a175e40a86da0d3a4a8fe7d1d6dd5c7c4ad1c3a54d8fd81441e47d0f590353f792b838b572f161de540f4b0c1fafe6c9f09e0471116193c7cba5fcd47f'
            '0f1d529f124feb83a92714cf20561161f42648c82e06ec49ff8a68b91b3b5fe34489016ced267015325aac6b18b47f93ae51eac673374dd43c440a159aa967d4'
            '153a3674ae1f48c4d20c0c00a2882aed9359ca1e7c2700efd24db25513f0d2950ed25f7642eea7c2e7226c92520be8a6be78a3d98daf47af6fbbd667499e3ef0'
            '713510162ed1ea0435a646d61077d1ceb9f40446f1686109373ebda1e613632af73f5c989fb8b4464811802a75f7dd4016443ea46c104102a70a3a07a12d01ff'
            '5816b6ddf5cd2f0fa74b178d5b6e26f5ff3a4e088a97b8361f2d39b15a780aef2a14b1c452ede486bcc8ed0b6854fe55de8c69bbee1ca3bbe43ed69c746a818e'
            'ec2960488e8652b075adae778cd38ca21302a0ba2696b376439c8486f1d975ee7bc4007bce58ce2601fbdf2ca45ce164b6550ca60871a76abec99be5743fa272'
            '152f56fdd3955a7de631c779d645c23685c86c4606bd5c9c2f120a185912309c89a4fb5235a5fb02f3fb63f3cd22f5e5c6f27953a892e3459157373a16b2f050'
            '6fc6c91e70910ab6f0bee501a5a47d159a3baffe0fa79c8b51727052bfd69d14ac954abcc4dc616ddae15cd59611a584d9f15f7c74dc9f2d3440455c867f8105'
            'f82e437fba4ee01a298dbaca600b5a51fc0f70acaef4f287283f14faaa4bddda5c825e3c446c686d4d37d997afe9d787abdbba3efe18293bee487f176c3dcdae'
            '6c672016defa2cec59422acbb2c09084e0a14b2c60413bc0f78484ec6d174e4ba4726e50ab1014fa8567d842e07ac7c25395e38394790305b63c0246b11ec15c'
            '1b8db28e70e2df08379baf8e21691824fa350aeeba5002f278db05a5b54c5ac2b90bd7e7dcc8912184f4c431197da78f3f6f4310bc6ec1c19a9d4ce8d10496e0'
            '2aca4ce28c18a87a09a205c6cb194146ad139c79a8d56c69819c776d7de3dfdaeee4a82968a45bc5e458fec7f7cbbc8d48eea8cf91c0e3a0b0e89ab36a59a51c'
            '57e690526db11084063a0ef57725a88285c03c2371702af0501d46eac6b9f67e864243750c1da9f9090de1238dec0a0b5d5c98eb8669ede1a8f93d3496049a33'
            'fe0bbdf756f504136ad623db4033e4eefdd15c4bfac11165e9c30dcb20f9ed5475299360634572ee3a7d3e14d0d4fd74b299fa1c870271314482e861649717b0'
            'decb91a8ddc1c64ce070c0857056ab4152218ec80bc476efa882b7d5ef294ab942b731e35feaffe93c03b543002c8d3730a8e54ac028ed94eb9059c020a96a97'
            '096cee96b43c69d65917473013cf18d18824b030d0c1fca563a3a77ac22537b78dc4b75051e300073d28c17eaa9fe10788ddab1349296296ef752c6b5af8bd5e'
            '74e5605eba7d09f8738ab5f2d2146ceae4c8cb9f91c040ecc6aee18e8a53c29c755fe6b87ce2648c09da7481c9c9d8949c24f494a45be746682e3d245c64583e'
            'c81c2b6b018f1a7d7480402edda44c73e9f472ed29198a903d35c47600778bb9bd4d946bcb42ea0f8d08b393a6f5b61372e47b37f18a3aa294842b63e91e032b'
            '4fcfdbbf3b89480c86f48797e99a265b8e4db2014003967cff08e138ea34b2cda032bbcfc2cd4dac3276187b4ecb4903e6dd91d7f14c8458fac573b70f133570'
            '26371f7f4c8195af07d40a502881289967f9f1a375167c3b9b9c93f123aeb223cd3cf10c2bd9b249c85bc130d059037973e4502f7f612c53b5fba8804ef3cfb6'
            'cd9a0d6387ceb84c92ea984b71e865560a3581531bffb5b73b699fbaebb3f7277c91d1163c5bcc3d3ef108b0fba62423366b3236ce5eaea864567b4cc9c6f517'
            '8eb61f6251141ea774298e222856d7f0b4dbf61d6c8a7d5703e5983f08786013e818ff91f001b2139b1290c56094e834b3f59af4165ccba0dcbd287e0c4a2163'
            '4b08fd0a2c6c19e8bf936f311f21f4d7b6952c94f38741ca22e3eadef50503235419c317a6e972646ea77c8ced2700272e65880258989332a432873f8f5976f7'
            '9d0e5186bfe47f8bf2e8134d289bbb9985472945dceae84ad795775bf4873bd1e6181ff0e66537d6247018198915e030700a8ac47fdc8e025e84aa9ec6513853'
            'aee26b1a0475186f1affa8da61dc2d97ef358063bf87cc6aaa9b6c670f85f421a33aff7dbd6f36f9b1cd109425c797e6ef4d5f44a5f36767c3defc80daec544e'
            '5a9cbccf2043da5af5ad1ca2c3d4d58048031bc29f73774f5ac62c940b29d0ad8d524dbb5f826536e60e2edb0e2a785524cac049c3aa9189023f4f3dd2694a68')
# Don't extract source archives
noextract=("${source[@]%%::*}")

package_ceph-libs-bin() {
  depends=(
    'bash'       'boost-libs'    'cryptsetup'          'curl'               'expat'
    'fmt'        'gcc-libs'      'glibc'               'gperftools'         'keyutils'
    'libaio'     'libcap'        'librabbitmq-c'       'librdkafka'         'libutil-linux'
    'libxcrypt'  'lua53'         'lz4'                 'nss'                'oath-toolkit'
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

    'bash'         'boost-libs'   'cryptsetup'     'expat'          'fmt'
    'fuse3'        'gawk'         'gcc-libs'       'gperftools'     'libaio'
    'libcap'       'libcap-ng'    'libnbd'         'libnl'          'librabbitmq-c'
    'librdkafka'   'lua'          'lvm2'           'oath-toolkit'   'python'
    'snappy'       'sqlite'       'systemd-libs'

    'python-bcrypt'      'python-cheroot'     'python-cherrypy'             'python-cmd2'                'python-colorama'
    'python-coverage'    'python-dateutil'    'python-importlib-metadata'   'python-jinja'               'python-jmespath'
    'python-jsonpatch'   'python-packaging'   'python-pecan'                'python-prettytable'         'python-pyopenssl'
    'python-requests'    'python-scipy'       'python-setuptools'           'python-typing_extensions'   'python-urllib3'
    'python-werkzeug'    'python-xmltodict'   'python-yaml'
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
