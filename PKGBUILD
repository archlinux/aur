# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=imod-binary
pkgver=4.9.10
pkgrel=2
pkgdesc="Image-Processing, Modeling and Display Programs for Tomography and 3D Reconstruction"
arch=('x86_64')
url="http://bio3d.colorado.edu/imod/"
license=('GPL')
provides=('3dmod' '3dmodv' 'addtostack' 'adocxmlconv' 'alignframes' 'alignlog' 'alterheader' 'archiveorig' 'assemblevol' 'autofidseed' 'autopatchfit' 'avganova' 'avgstack' 'avgstatplot' 'b3dcatfiles' 'b3dcopy' 'b3dhostname' 'b3dremove' 'b3dtouch' 'b3dwinps' 'batchruntomo' 'beadtrack' 'binvol' 'blendmont' 'boxavg' 'boxstartend' 'calc' 'ccderaser' 'checkmtmod' 'checkxforms' 'chunksetup' 'clip' 'clipmodel' 'clonemodel' 'clonevolume' 'collectmmm' 'colornewst' 'combinefft' 'contourmod' 'convertmod' 'copyheader' 'copytomocoms' 'corrsearch3d' 'cryoposition' 'ctfphaseflip' 'ctfplotter' 'densmatch' 'densnorm' 'dm2mrc' 'dm3props' 'dualvolmatch' 'echo2' 'edgeeraser' 'edgemtf' 'edgepatches' 'edmont' 'edpiecepoint' 'endmodel' 'enhance' 'eraser' 'etomo' 'etomo.jar' 'etomoPluginDemo' 'excise' 'excludeviews' 'expandargs' 'extposition' 'extractmagrad' 'extractpieces' 'extracttilts' 'extstack' 'fenestra' 'fftrans' 'fiberpitch' 'filltomo' 'filterplot' 'findbeads3d' 'findcontrast' 'finddistort' 'findgradient' 'findhotpixels' 'findsection' 'findsirtdiffs' 'findwarp' 'finishjoin' 'fitpatches' 'fixboundaries' 'fixmont' 'flattenwarp' 'framewatcher' 'genhstplt' 'goodframe' 'gpumonitor' 'gputilttest' 'header' 'howflared' 'idfprocess' 'imavgstat' 'imod' 'imod2meta' 'imod2obj' 'imod2patch' 'imod2rib' 'imod2vrml' 'imod2vrml2' 'imodauto' 'imodchopconts' 'imodcpuload' 'imodcurvature' 'imod-dist' 'imodexplode' 'imodextract' 'imodfillin' 'imodfindbeads' 'imodhelp' 'imodinfo' 'imodjoin' 'imodkillgroup' 'imodmesh' 'imodmop' 'imodpsview' 'imodqtassist' 'imodsendevent' 'imodsetvalues' 'imodsortsurf' 'imodtrans' 'imoduntar' 'imodv' 'joinmodel' 'joinwarp2model' 'makecomfile' 'makegradtable' 'makejoincom' 'makepyramid' 'MarkersCorrespond' 'matchorwarp' 'matchrotpairs' 'matchshifts' 'matchvol' 'maxjoinsize' 'midas' 'model2point' 'montagesize' 'mrc2tif' 'mrcbyte' 'mrctaper' 'mrcx' 'mtdetect' 'mtffilter' 'mtk' 'mtlengths' 'mtmodel' 'mtoverlap' 'mtpairing' 'mtrotlong' 'mtsmooth' 'mtteach' 'nad_eed_3d' 'nda' 'newstack' 'numericdiff' 'onegenplot' 'onepatchcorr' 'patch2imod' 'patchcorr3d' 'patchcrawl3d' 'pickbestseed' 'point2model' 'preNAD' 'preNID' 'processchunks' 'prochunks.csh' 'queuechunk' 'RAPTOR' 'raw2mrc' 'rawtiltcoords' 'realscalemod' 'rec2imod' 'recombine' 'reducecont' 'reducemont' 'reducemtmod' 'refinematch' 'remapmodel' 'repackseed' 'resamplemod' 'restrictalign' 'rotatevol' 'rotmont' 'runimodqtapp' 'runraptor' 'sampletilt' 'scalemodel' 'sda' 'selfalign' 'setlibpath' 'settmpdir' 'setupcombine' 'setupcoms' 'setuplong' 'setupstitch' 'sirtsetup' 'slashfindspheres' 'slashmasksort' 'slurmCleanup.sh' 'slurmInit.sh' 'smoothsurf' 'solvematch' 'sortbeadsurfs' 'splitblend' 'splitcombine' 'splitcorrection' 'splitmrc' 'splittilt' 'squeezevol' 'startprocess' 'stitchalign' 'subimage' 'subimanova' 'subimstat' 'subm' 'submfg' 'subtomosetup' 'subtractcurves' 'sumdensity' 'taperoutvol' 'tapervoledge' 'tif2mrc' 'tilt' 'tiltalign' 'tiltxcorr' 'tomodataplots' 'tomopieces' 'tomopitch' 'tomosnapshot' 'tomostitch' 'transferfid' 'trimvol' 'vmstocsh' 'vmstopy' 'warpvol' 'wmod2imod' 'xcorrstack' 'xf2rotmagstr' 'xfalign' 'xfforfidless' 'xfinterstack' 'xfinverse' 'xfjointomo' 'xfmodel' 'xfproduct' 'xfsimplex' 'xftoxg' 'xyzproj')
depends=('libjpeg6-turbo' 'python')
optdepends=('cuda>=8.0.0: for library bindings'
            'tcsh: for only a few very specializied scripts')
source=('https://bio3d.colorado.edu/imod/AMD64-RHEL5/imod_4.9.10_RHEL7-64_CUDA8.0.sh'
        'imod.sh')
md5sums=('09dea781cbefa60f1b8360ed622ab709'
         '17e904b7f7c168e45793dc00d8a6aa57')

pkgver() {
  echo "$pkgver"
}

build() {
  sh imod_4.9.10_RHEL7-64_CUDA8.0.sh -extract
  
  cd "IMODtempDir/"
  tar xvzf "imod_${pkgver}_RHEL7-64_CUDA8.0.tar.gz"
}


package() {
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/IMODtempDir/imod_$pkgver/" "$pkgdir/opt/"
  mv "$pkgdir/opt/imod_$pkgver" "$pkgdir/opt/imod"

  mkdir -p "$pkgdir/etc/profile.d/"
  cp "imod.sh" "$pkgdir/etc/profile.d/"
}

# vim:set ts=2 sw=2 et:
